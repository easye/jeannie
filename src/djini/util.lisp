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
  (format nil "~a/~a" parent (stringify (gensym))))
