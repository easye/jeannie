;;; Everything in this package is pure Common Lisp
(asdf:defsystem :djini
  :description "Common Lisp-only local peer implementation."
  :version "0.0.2"
  :depends-on (#+abcl
               jeannie 
;;             restas cl-who parenscript drakma 
#+nil              ironclad) ;; 
  :components ((:file "packages")
               (:module src 
                        :serial t 
                        :components ((:file "rdf")
                                     (:file "djini")))))

