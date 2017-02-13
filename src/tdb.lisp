(in-package :jeannie)

#|
<https://jena.apache.org/documentation/javadoc/jena/org/apache/jena/rdf/model/Model.html>
|#

(defun affirm (subject property value
               &key
                 (path #p"/var/tmp/ds/")
                 (namespace "http://example.org/jeannie#"))
  "Affirm that SUBJECT has PROPERTY with VALUE.

Persist statement to tdb store at PATH, adding if it already exists. 

This function aquires a WRITE transaction on the tdb store at PATH, intended for intra-JVM
resource contention.  Under load, i.e. multiple writes, this strategy will degrade quickly."
   (unless (probe-file path)
     (note "Ensuring directories exist for '~a'." path)
     (ensure-directories-exist path))
  (let ((dataset (create-persistent-dataset path))
        model s p)
    (unwind-protect
         (progn
           (#"begin" dataset #"ReadWrite.WRITE")
           (setf model (#"getDefaultModel" dataset))
           (setf s (#"createResource" model subject))
           (setf p (#"createProperty" model namespace property))
           (#"addProperty" s p value)
           (#"commit" dataset))
      (#"end" dataset)))
  (values
   (snapshot path)
   path
   namespace))

(defun snapshot (path)
  "Create a snapshot of the model for tdb store at PATH"
    
  (let ((result (#"createDefaultModel" 'ModelFactory))
        (dataset (#"createDataset" 'TDBFactory (namestring (pathname path))))
        model)
    (unwind-protect
         (progn
           (#"begin" dataset #"ReadWrite.READ")
           (setf model (#"getDefaultModel" dataset))
           (#"add" result model))
      (#"end" dataset))
    result))

(defun create-memory-dataset ()
  "Create a memory mapped triple dataset."
  (#"createTxnMem" 'DatasetFactory))                            

(defun create-persistent-dataset (directory)
  "Create a TDB triple store under DIRECTORY."
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
