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
  (with-ensured-model (model)
  ;;; FIXME: refactor out of ABCL-specific implmentation with UIOP
    (let ((file (ext:make-temp-file)))
      (alexandria:write-string-into-file buffer file
                                         :if-exists :supersede)
      (read-rdf file :format format :model model))))

(defun read-model (filename format
                   &key
                     (model *model*)
                     (base "http://example.org/jeannie/read-model"))
  "Read FILENAME for FORMAT."
  (with-ensured-model (model)
    (with-open-file (s filename :direction :input)
      (let ((input-stream (jstream s)) 
            (reader (#"getReader" model (symbol-name format))))
        (unwind-protect
             (handler-case
                 (progn
                   (#"read" reader model input-stream base)
                   model)
               (java:java-exception (e)
                 (note "Failed to deserialize ~a as ~a: ~a"
                       filename format e)
                 nil))
          (#"close" input-stream))))))

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
'RDF/XML' 'N-TRIPLE' 'TURTLE'.  The default is 'RDF/XML'."
  (unless model
    (setf model (#"createDefaultModel" 'ModelFactory)))
  (let* (#+nil ; unused TODO use for validation of allowed keywords
         (parsers '(:RDF/XML :N-TRIPLE :TRIPLE :N3))
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

(defun list-statements (model &key subject predicate object
                                (to-string-p t))
  "List all statements in MODEL.

If SUBJECT, PREDICATE, or OBJECT have values, they will be used to
constrain the statements.  

If TO-STRING-P is nil, references to the underlying Jena objects will
be returned as opposed to their string representation."
  (let ((s (if subject
               (#"createResource" 'rdf.model.ResourceFactory subject)
               java:+null+))
        (p (if predicate
               (#"createProperty" 'rdf.model.ResourceFactory predicate)
               java:+null+))
        (o (if object
               (#"createProperty" 'rdf.model.ResourceFactory object)
               java:+null+)))
    (let ((result (jss:j2list (#"listStatements" model s o p))))
      (if to-string-p
          (mapcar #"toString" result)
          result))))

(defun list-objects (model
                     &key (to-string-p t))
    "List all objects in MODEL.

If TO-STRING-P is nil, references to the underlying Jena objects will
be returned as opposed to their string representation."

  (let ((result (jss:j2list (#"listObjects" model))))
      (if to-string-p
          (mapcar #"toString" result)
          result)))

(defun list-namespaces (model
                        &key (to-string-p t))
      "List all namespaces in MODEL.

If TO-STRING-P is nil, references to the underlying Jena objects will
be returned as opposed to their string representation."

  (let ((result (jss:j2list (#"listNameSpaces" model))))
      (if to-string-p
          (mapcar #"toString" result)
          result)))

(defun list-subjects (model
                      &key (to-string-p t))
        "List all subjects in MODEL.

If TO-STRING-P is nil, references to the underlying Jena objects will
be returned as opposed to their string representation."

  (let ((result (jss:j2list (#"listSubjects" model))))
    (if to-string-p
        (mapcar #"toString" result)
        result)))

(defun make-literal (value &key
                             (type nil type-p)
                             (model nil))
  "Create a literal with VALUE of DATATYPE in MODEL."
  (with-ensured-model (model)
    (values 
     (#"createTypedLiteral" model value)
     model)))



                      
