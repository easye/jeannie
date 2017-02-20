;;; -*- Mode: LISP; Syntax: COMMON-LISP -*-
#-abcl (error "You need the Bear for this one")

(require :asdf)
(in-package :cl-user)

(asdf:defsystem jeannie
  :description "A wrapping of Jena for Armed Bear Common Lisp."
  :version "0.8.0"
  :defsystem-depends-on (abcl-asdf)
  :depends-on (simple-date-time
               alexandria)
  :components ((:module apache-jena :serial t :components
                        ((:mvn "org.apache.jena/jena-core/3.2.0")
                         (:mvn "org.apache.jena/jena-arq/3.2.0")))
               (:module reasoner :depends-on (source)
                        :pathname "src/"
                        :components ((:file "reason")))
               (:module package :pathname "src" 
                        :components ((:file "package")))
               (:module source :depends-on (package apache-jena)
                        :pathname "src/"
                        :serial t
                        :components ((:file "note")
                                     (:file "java")
                                     (:file "index")
                                     (:file "jena"))))
  :in-order-to ((asdf:test-op (asdf:test-op jeannie/test))))

(asdf:defsystem jeannie/tdb
  :description "Access to TDB triple store instances on local filesystem."
  :version "0.3.0"
  :defsystem-depends-on (abcl-asdf)
  :depends-on (jeannie)
  :components ((:module tdb :pathname "src/" :components
                        ((:mvn "org.apache.jena/jena-tdb/3.2.0")
                         (:file "tdb")))))

(asdf:defsystem jeannie/server/fuseki
  :description "Use of Fuseki Embedded server for managing SPARQL endpoints."
  :version "0.2.0"
  :defsystem-depends-on (abcl-asdf)
  :depends-on (jeannie/tdb)
  :components ((:module fuseki :components
                        ((:mvn "org.apache.jena/jena-fuseki-embedded/2.5.0")))
               (:module server :depends-on (fuseki) :pathname "src/"
                        :components ((:file "server")))))

(asdf:defsystem jeannie/server
  :depends-on (jeannie/server/fuseki))

(asdf:defsystem jeannie/test
  :version "0.7.2"
  :defsystem-depends-on (prove-asdf)
  :depends-on (jeannie
               jeannie/tdb
               jeannie/server/fuseki
               prove)
  :components ((:module package :pathname "t/"
                        :components ((:file "package")))
               (:module tdb :pathname "t/"
                        :depends-on (package)
                        :components ((:test-file "persist")))
               #+nil
               (:module literals :pathname "t/"
                        :depends-on (package)
                        :components ((:test-file "literals")))
               (:module owl :pathname "t/"
                        :depends-on (package)
                        :components ((:test-file "owl-reasoner")))
               (:module sparql :pathname "t/"
                        :depends-on (package)
                        :components ((:test-file "sparql")))
               (:module t :depends-on (package)
                        :components ((:test-file "jeannie"))))
  :description "Test system for jeannie"
  :perform (asdf:test-op (op c)
                         (uiop:symbol-call :prove-asdf 'run-test-system c)))

