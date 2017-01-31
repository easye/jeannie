;;; -*- Mode: LISP; Syntax: COMMON-LISP -*-
#-abcl (error "You need the Bear for this one")

(asdf:defsystem jeannie
  :description "A wrapping of Jena for Armed Bear Common Lisp."
  :version "0.5.0"
  :defsystem-depends-on (abcl-asdf)
  :depends-on (simple-date-time)
  :components ((:module jena :serial t :components
                        ((:mvn "org.apache.jena/jena-core/3.1.1")
                         (:mvn "org.apache.jena/jena-arq/3.1.1")))
               (:module fuseki :depends-on (jena package) :components
                        ((:mvn "org.apache.jena/jena-fuseki-embedded/2.4.1")))
               (:module tdb :depends-on (source)
                        :pathname "src/" :components
                        ((:mvn "org.apache.jena/jena-tdb/3.1.1")
                         (:file "tdb")))
               (:module server :depends-on (fuseki tdb) :pathname "src/"
                        :components ((:file "server")))
               (:module reasoner :depends-on (source)
                        :pathname "src/"
                        :components ((:file "reason")))
               (:module package :pathname "src" 
                        :components ((:file "package")))
               (:module source :depends-on (jena)
                        :pathname "src/"
                        :serial t
                        :components ((:file "note")
                                     (:file "java")
                                     (:file "index")
                                     (:file "jena"))))
  :in-order-to ((test-op (test-op jeannie/test))))

(asdf:defsystem jeannie/test
  :defsystem-depends-on (prove-asdf)
  :depends-on (jeannie
               prove)
  :components ((:module package :pathname "t/"
                        :components ((:file "package")))
               (:module tdb :pathname "t/"
                        :depends-on (package)
                        :components ((:file "persist")))
               (:module owl :pathname "t/"
                        :depends-on (package)
                        :components ((:test-file "owl-reasoner")))
               (:module sparql :pathname "t/"
                        :depends-on (package)
                        :components ((:test-file "sparql")))
               (:module t :depends-on (package)
                        :components ((:test-file "jeannie"))))
  :description "Test system for jeannie"
  :perform (test-op (op c)
                    (uiop:symbol-call :prove-asdf 'run-test-system c)))

