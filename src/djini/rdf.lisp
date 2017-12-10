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

(defgeneric write-rdf (destination source))

(defmethod write-rdf (destination (sexp pathname))
  (declare (ignore destination))
  (error "Unimplemented."))

(defmethod write-rdf (destination (json string))
  (declare (ignore destination))
  (let ((jsown (jsown:parse json))
        (subject "_:1"))
    (declare (ignore subject))
    jsown
    #+(or)
    (loop
       :for obj in jsown
       :collecting (list subject
                         (if (consp obj)
                             (loop :for o :across obj
                                :collecting (stringify o))
                             obj)))))
    
    


