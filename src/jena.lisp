(in-package :jeannie)

(defparameter *model* nil)

;;; See JEANIE:PARSE for the generic function interface to serialized RDF
(defun read-rdf (filename &key
                            (format "N3")
                            (model *model*))
                            
  "Deserializes the contents of FILENAME returning the results in MODEL.

If MODEL is nil, a new model is created.

Optionally specify the input via FORMAT, one of at least the set 'N3'
'RDF/XML' 'N-TRIPLE' 'TURTLE'.  The default is 'N3'."


  (unless model
    (setf model (#"createDefaultModel" 'ModelFactory)))
  (let ((formats  '("N3" "RDF/XML" "N-TRIPLE" "TURTLE"))
        (base "https://jena.not.org/index#rdf"))
    (declare (ignore formats))
    (with-open-file (s filename :direction :input)
      (let ((input-stream (jstream s))
            (reader (#"getReader" model format)))
        (#"read" reader model input-stream base))))
  model)

;;; introspect a Model

;;; (let ((i (#"listObjects" *model*)) ) (values (#"next" i) (#"next" i) (#"next" i) ))  --> com.hp.hpl.jena.rdf.model.impl.ResourceImpl

;; implement me!
;; (defmacro jiterator-to-list (get-iterator model)
;;     (mapcar #"toString" (loop :with iterator = (#"listStatements" *model*) :while (#"hasNext" iterator) :collect (#"next" iterator)))

(defun list-statements (&optional (model *model*))
    (mapcar #"toString" 
            (loop 
               :with iterator = (#"listStatements" *model*) 
               :while (#"hasNext" iterator)
               :collect (#"next" iterator))))

(defun list-objects (&optional (model *model*))
    (mapcar #"toString" 
            (loop 
               :with iterator = (#"listObjects" *model*) 
               :while (#"hasNext" iterator)
               :collect (#"next" iterator))))

(defun list-namespaces (&optional (model *model*))
    (mapcar #"toString" 
            (loop 
               :with iterator = (#"listNameSpaces" *model*) 
               :while (#"hasNext" iterator)
               :collect (#"next" iterator))))

(defun list-subjects (&optional (model *model*))
    (mapcar #"toString" 
            (loop 
               :with iterator = (#"listSubjects" *model*) 
               :while (#"hasNext" iterator)
               :collect (#"next" iterator))))


