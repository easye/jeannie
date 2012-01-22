(in-package :jeannie)

;;; FIXME need a test
(defun read (&key (file "index.rdf"))
  (with-open-stream (s file :direction :input)
    (let* ((lang "N3")
           (base "https://jena.not.org/index#rdf")
           (reader (#"getReader" 'RDFReaderF lang))
           (model (jss:jnew 'Model))
           (input-stream (jstream s)))
      (#"read" input-stream base lang))))