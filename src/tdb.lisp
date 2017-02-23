(in-package :jeannie)

#|
<https://jena.apache.org/documentation/javadoc/jena/org/apache/jena/rdf/model/Model.html>
|#

(defun affirm (subject property object
               &key
                 (path #p"/var/tmp/ds/"))

  "Affirm that SUBJECT has PROPERTY with VALUE.

Persist statement to tdb store at PATH, adding if it already exists. 

This function aquires a write transaction on the tdb store at PATH, intended for intra-jvm
resource contention.  Under load, i.e. multiple writes, this strategy will degrade quickly."
  (let ((dataset (ensure-persistent-dataset path)))
    (unwind-protect
         (progn
           (#"begin" dataset #"ReadWrite.WRITE")
           (let* ((model (#"getDefaultModel" dataset))
                  (s (#"createResource" model
                                        (if (pathnamep subject)
                                            (namestring subject)
                                            subject)))
                  (p (#"createProperty" model
                                        (if (pathnamep property)
                                            (namestring property)
                                            property)))
                  (o (if (pathnamep object)
                         (#"createResource" model (namestring object))
                         (#"createLiteral" model object))))
             (#"addProperty" s p o)
             (#"commit" dataset)))
      (#"end" dataset)))
  (values
   (snapshot path)
   path))

(defun snapshot (path)
  "Create a snapshot of the model for tdb store at PATH"
    
  (let ((result (make-memory-model))
        (dataset (#"createDataset" 'TDBFactory (namestring (pathname path))))
        model)
    (unwind-protect
         (progn
           (#"begin" dataset #"ReadWrite.READ")
           (setf model (#"getDefaultModel" dataset))
           (#"add" result model))
      (#"end" dataset))
    result))

(defun make-memory-dataset ()
  "Create a memory mapped triple dataset."
  (#"createTxnMem" 'DatasetFactory))                            

(defun ensure-persistent-dataset (directory)
  "Ensure that a tdb triple store exists under under DIRECTORY.

A previously existing store will be re-opened in this jvm process."
  (unless (probe-file directory)
    (note "Ensuring directories exist for '~a'." directory)
    (ensure-directories-exist directory))
  (let ((d (pathname directory)))
    (#"createDataset" 'TDBFactory (namestring d))))

#|
<https://jena.apache.org/documentation/tdb/java_api.html>

Dataset dataset = TDBFactory.createDataset(directory) ;
  ...
  dataset.begin(ReadWrite.READ) ;
  // Get model inside the transaction
  Model model = dataset.getDefaultModel() ;
  dataset.end() ;
  ... 
  dataset.begin(ReadWrite.WRITE) ;
  model = dataset.getDefaultModel() ;
  dataset.end() ;
|#
