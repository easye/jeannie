;;; -*- Mode: LISP; Syntax: COMMON-LISP -*-
#-abcl (error "You need the Bear for this one")

(asdf:defsystem jeannie
  :description "A wrapping of Jena for Armed Bear Common Lisp."
  :version "0.4.0"
  :defsystem-depends-on (abcl-asdf)
  :components ((:module jena :serial t :components
                        ((:mvn "org.apache.jena/jena-core/3.1.1")
                         (:mvn "org.apache.jena/jena-arq/3.1.1")))
               (:module fuseki :depends-on (jena package) :components
                         ((:mvn "org.apache.jena/jena-fuseki-embedded/2.4.1")))
               (:module server :depends-on (fuseki) :pathname "src/"
                        :components ((:file "server")))
               (:module package :pathname "src" 
                        :components ((:file "package")))
               (:module src :depends-on (jena)
                        :serial t
                        :components ((:file "java")
                                     (:file "index")
                                     (:file "jena"))))
  :in-order-to ((test-op (test-op jeannie/test))))

(asdf:defsystem jeannie/test
  :defsystem-depends-on (prove-asdf)
  :depends-on (jeannie
               prove)
  :components ((:module package :pathname "t/"
                        :components ((:file "package")))
               (:module t :depends-on (package)
                        :components ((:test-file "jeannie"))))
  :description "Test system for jeannie"
  :perform (test-op (op c)
                    (uiop:symbol-call :prove-asdf 'run-test-system c)))

