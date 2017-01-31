(in-package :jeannie)

(defun note (message-or-format &rest args)
  "Emit a note of progress to the appropiate logging system."
  (format t 
          "~a ~a~%"
;;          (simple-date-time:|yyyymmddThhmmssZ|
          (simple-date-time:|yyyy-mm-dd hh:mm:ss|
                            (simple-date-time:now))
          (apply 'format 
                 nil
                 message-or-format
                 (if args 
                     args
                     nil))))
;;; utils sometimes occur as FLET forms for local clarity
(defun listify (cons-or-atom)
  (if (consp cons-or-atom)
      cons-or-atom
      (list cons-or-atom)))
