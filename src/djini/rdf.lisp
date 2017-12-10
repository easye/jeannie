;;; Basic RDF triple, as array sequence
(in-package djini)

(defstruct triple 
  (data))
;; :type array))
;; (array (0 2))))

(defun init (triple)
  (setf triple-data (make-array 3)))

(defun construct ()
  (init (make-triple)))

(defun write-rdf (json)
  (error "Unimplemented WRITE-RDF."))


