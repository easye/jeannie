;;; Everything in this package is pure Common Lisp
(defsystem djini
  :components ((:module package
                        :pathname "src/djini/"
                        :components ((:file "package")))
               (:module util :depends-on (package)
                        :pathname "src/djini/"
                        :components ((:file "util")))
               (:module src :depends-on (util)
                        :pathname "src/djini/"
                        :components ((:file "djini"))))
  :in-order-to ((asdf:test-op (asdf:test-op djini/t))))

(defsystem djini/stagger
  :depends-on (djini
               stagger))

(defsystem djini/json
  :depends-on (djini
               jsown)
  :components ((:module source
                        :pathname "src/djini/"
                        :components ((:file "rdf")))))

(defsystem djini/t
  :defsystem-depends-on (prove-asdf)
  :depends-on (prove
               djini/json)
  :perform (asdf:test-op (op c)
                         (uiop:symbol-call :prove-asdf 'run-test-system c))
  :components ((:module "src/djini/t"
                        :components
                        ((:test-file "subject")
                         (:test-file "serialize")))))

