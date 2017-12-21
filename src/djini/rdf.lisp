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

(defgeneric emit-rdf (destination source subject)
  (:documentation "Emit textual represenation of SOURCE to DESTINATION with SUBJECT."))

(defmethod emit-rdf (destination (input-file-containing-sexp pathname) subject)
  (let ((sexp (with-open-file (o input-file-containing-sexp :direction :input)
                (read o))))
    (emit-rdf destination sexp subject)))

(defmethod emit-rdf (destination (json string) subject)
  (declare (ignore subject))
  (let ((jsown (jsown:parse json))
        (child-subject (format nil "_:~a" (random (expt 3 17)))))
    (emit-rdf destination jsown child-subject)))

(defvar *last-object* nil) ;;; DEBUG

(defmethod emit-rdf (destination (object cons) subject)
  (push object *last-object*) ;;; DEBUG
  (cond
    ((and
      (consp object)
      (consp (cdr object))
      (= (length object) 1))
     (emit-rdf destination (first object) subject))
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
        :collect (emit-rdf destination
                            pair
                            subject)
        :else
        :when (not (eq pair :obj))
        :collect pair))))
        




                              
    


