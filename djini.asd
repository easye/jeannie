;;; Everything in this package is pure Common Lisp
(asdf:defsystem :djini
  :description "Common Lisp-only local peer implementation."
  :version "0.1.0"
  :depends-on (stagger)
  :components ((:module package
                        :pathname "src/djini/"
                        :components ((:file "package")))
               (:module src :depends-on (package)
                        :pathname "src/djini/"
                        :serial t 
                        :components ((:file "rdf")
                                     (:file "djini")))))

