;;; -*- Mode: LISP; Syntax: COMMON-LISP -*-
#-abcl (error "You need the Bear for this one")

(asdf:defsystem jeannie
  :description "A wrapping of Jena for Armed Bear Common Lisp."
  :version "0.3.0"
  :defsystem-depends-on (abcl-asdf)
  :depends-on ()
  :components ((:module jena :serial t :components
                        ((:mvn "org.apache.jena/jena-core/3.1.1")
                         (:mvn "org.apache.jena/jena-arq/3.1.1")))
               (:module package :pathname "" :depends-on (:jena) 
                        :components ((:file "packages")))
               (:module src :components ((:file "java")
                                         (:file "index")
                                         (:file "jena" :depends-on ("java")))))
  :in-order-to ((test-op (test-op jeannie-test))))

(asdf:defsystem jeannie/test
  :depends-on (:jeannie
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "jeannie"))))
  :description "Test system for jeannie"
  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
