(in-package :jeannie)

(defun get-reasoner (&key (type "OWL"))
  (declare (ignore type))
  (#"getOWLReasoner" 'ReasonerRegistry))

(defun inferred-model (model)
  (let ((reasoner (get-reasoner)))
    (#"createInfModel" 'ModelFactory reasoner model)))

    


    
