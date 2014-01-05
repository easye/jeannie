;;; Basic RDF triple, as array sequence
(in-package :org.not.djini)

(defstruct triple 
  (data))
;; :type array))
;; (array (0 2))))

(defun init (triple)
  (setf triple-data (make-array 3)))

(defun construct ()
	(org.not.djini::init (make-triple)))

