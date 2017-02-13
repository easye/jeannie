(in-package :jeannie)

(defparameter *model* nil)

(defgeneric read-rdf (filename &key
                                 (format :rdf/xml)
                                 (model *model*)))

(defmethod read-rdf ((buffer string)
                     &key
                       (resignal-error nil)
                       (format :rdf/xml)
                       (model *model*))
  (unless model
    (setf model (#"createDefaultModel" 'ModelFactory)))
  ;;; FIXME: refactor out of ABCL-specific implmentation with UIOP
  (let ((file (ext:make-temp-file)))
    (alexandria:write-string-into-file buffer file
                                       :if-exists :supersede)
    (read-rdf file :format format :model model)))

(defun read-model (filename format
                   &key
                     (model *model*)
                     (base "http://example.org/jeannie/read-model"))
  "Read FILENAME for FORMAT."
  (unless model
    (setf model (#"createDefaultModel" 'ModelFactory)))
  (with-open-file (s filename :direction :input)
    (let ((input-stream (jstream s)) ;;; TODO close me (finally)
          (reader (#"getReader" model (symbol-name format))))
      (handler-case
          (progn
            (#"read" reader model input-stream base)
            model)
        (java:java-exception (e)
          (note "Failed to deserialize ~a as ~a: ~a"
                filename format e)
          nil)))))

(defparameter *file-type-parser-hint*
  '(("n3" :n3)
    ("owl" :rdf/xml)
    ("rdf" :rdf/xml)
    ("ttl" :triple)))

;;; See JEANIE:PARSE for the generic function interface to serialized RDF
(defmethod read-rdf ((filename pathname)
                     &key
                       (format :rdf/xml format-p)
                       (base "https://not.example.org/index#rdf") ;; FIXME bogus
                       (model *model*))
  "Deserializes the contents of FILENAME returning the results in MODEL.

If MODEL is nil, a new Jene in-memory model is created.  Otherwise the
read operation will add triples to MODEL.

If BASE is a string, it is used as the @base uri of relative uris in
the read operation.  

Optionally specify the input via FORMAT, one of at least the set 'N3'
'RDF/XML' 'N-TRIPLE' 'TURTLE'.  The default is 'N3'."
  (unless model
    (setf model (#"createDefaultModel" 'ModelFactory)))
  (let* ((parsers '(:RDF/XML :N-TRIPLE :TRIPLE :N3))
         (parser
          (if format-p
              (if (keywordp format)
                  format
                  (intern format :keyword))
              (let ((match (assoc (pathname-type filename) *file-type-parser-hint* :test 'string-equal)))
                (if match
                    (cadr match)
                    :rdf/xml)))))
    (read-model filename parser :model model)))
    
;;; TODO: introspect a Model

#|
(let ((i (#"listObjects" *model*)) ) (values (#"next" i) (#"next" i) (#"next" i) ))  

  --> com.hp.hpl.jena.rdf.model.impl.ResourceImpl
|#
;; implement me!
;; (defmacro jiterator-to-list (get-iterator model)
;;     (mapcar #"toString" (loop :with iterator = (#"listStatements" *model*) :while (#"hasNext" iterator) :collect (#"next" iterator)))

(defun list-statements (model &key subject predicate object)
  (let ((s (if subject
               (#"createResource" 'rdf.model.ResourceFactory subject)
               java:+null+))
        (p (if predicate
               (#"createProperty" 'rdf.model.ResourceFactory predicate)
               java:+null+))
        (o (if object
               (#"createProperty" 'rdf.model.ResourceFactory object)
               java:+null+)))
    (mapcar #"toString" 
            (loop 
               :with iterator = (#"listStatements" model s o p)  
               :while (#"hasNext" iterator)
               :collect (#"next" iterator)))))

(defun list-objects (model)
    (mapcar #"toString" 
            (loop 
               :with iterator = (#"listObjects" model) 
               :while (#"hasNext" iterator)
               :collect (#"next" iterator))))

(defun list-namespaces (model)
    (mapcar #"toString" 
            (loop 
               :with iterator = (#"listNameSpaces" model) 
               :while (#"hasNext" iterator)
               :collect (#"next" iterator))))

(defun list-subjects (model)
    (mapcar #"toString" 
            (loop 
               :with iterator = (#"listSubjects" model) 
               :while (#"hasNext" iterator)
               :collect (#"next" iterator))))


(defun make-literal (value &key
                             (type nil type-p)
                             (model nil))
  "Create a literal with VALUE of DATATYPE in MODEL."
  (unless model
    (setf model (#"createDefaultModel" 'ModelFactory)))
  (values 
   (#"createTypedLiteral" model value)
   model))


                      
