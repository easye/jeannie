(in-package :jeannie)

(defun make-memory-model ()
  "Make a new default Jena model in memory."
  (#"createDefaultModel" 'ModelFactory))

;;; TODO check that a model actually references a model
(defmacro with-ensured-model ((model) &body body)
  `(progn
     (unless ,model
       (setf ,model (make-memory-model)))
     ,@body))





