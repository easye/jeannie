(in-package :jeannie)

(defparameter *model* nil)

;;; FIXME need a test
(defun read-rdf (&optional &key (file #p"index.rdf"))
  (unless *model*
    (setf *model* (#"createDefaultModel" 'ModelFactory)))
  (with-open-file (s file :direction :input)
    (let* ((lang "N3")
           (base "https://jena.not.org/index#rdf")

           (reader (#"getReader" *model* lang))
           (input-stream (jstream s)))
      (#"read" reader *model* input-stream base))))
