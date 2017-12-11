;;; Basic RDF triple, as array sequence
(in-package djini)

(defstruct triple 
  (data))
;; :type array))
;; (array (0 2))))

;;; FIXME
(defun init (triple)
  (unless triple
    (make-array 3)))

(defun construct ()
  (init (make-triple)))

(defgeneric write-rdf (destination source subject)
  (:documentation "Emit textual represenation of SOURCE to DESTINATION with SUBJECT."))

(defmethod write-rdf (destination (file-containing-sexp pathname) subject)
  (declare (ignore destination subject))
  (error "Unimplemented."))

(defmethod write-rdf (destination (json string) subject)
  (declare (ignore subject))
  (let ((jsown (jsown:parse json))
        (child-subject (format nil "_:~a" (random (expt 3 17)))))
    (write-rdf destination jsown child-subject)))

(defvar *last-object* nil) ;;; DEBUG

(defmethod write-rdf (destination (object cons) subject)
  (push object *last-object*) ;;; DEBUG
  (cond
    ((and
      (consp object)
      (consp (cdr object))
      (= (length object) 1))
     (write-rdf destination (first object) subject))
    ((and
      (consp object)
      (not (consp (cdr object))))
     (list 
      subject (car object) (cdr object)))
    (t 
     (loop
        :for pair :in object
        :with subject = (make-new-subject subject)
        :if (consp pair)
        :collect (write-rdf destination
                            pair
                            subject)
        :else
        :when (not (eq pair :obj))
        :collect pair))))
        




                              
    


