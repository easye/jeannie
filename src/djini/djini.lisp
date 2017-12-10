(in-package djini)

(defun start-peer ()
  (warn "Unimplemented.")
#+nil  (restas:start-server))

(defparameter *model* nil)

(defun persist (rdf)
  (append *model*
		  (loop :for statement :in 
			 (list-statements (read-rdf rdf))
			 :doing (push (setf (elt (construct) 0)
								statement)
						  *model*))))

			 
