(in-package :jeannie)

(defun get-reasoner (&key (type "OWL"))
  (declare (ignore type))
  (#"getOWLReasoner" 'ReasonerRegistry))


    
