(in-package :jeannie)

(defparameter *model* nil)

;;; FIXME define as generic function
(defun read-rdf (filename)
  "Reads the contents of FILENAME as n3 triples. 

As a side-effect, the special variable JEANNIE:*MODEL* is set to the
result of this call."

  (unless *model*
    (setf *model* (#"createDefaultModel" 'ModelFactory)))
  (with-open-file (s filename :direction :input)
    (let* ((lang "N3")
           (base "https://jena.not.org/index#rdf")

           (reader (#"getReader" *model* lang))
           (input-stream (jstream s)))
      (#"read" reader *model* input-stream base)))
  *model*)
