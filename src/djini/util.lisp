(in-package djini)

(defun stringify (thing)
  (cond
    ((pathnamep thing)
     (namestring thing))
    ((stringp thing)
     thing)
    ((keywordp thing)
     (concatenate 'string
                  ":"
                  (symbol-name thing)))
    ((symbolp thing)
     (symbol-name thing))
    (t
     (error "Don't know how stringify ~a." thing))))
  
(defun make-new-subject (parent)
  "Return a string representing a new blank node within a 'namespace' referencing PARENT."
  (format nil "~a_~a" parent (stringify (gensym))))
