;;; -*- Mode: LISP; Syntax: COMMON-LISP -*-
#-abcl (error "You need the Bear for this one")

(defsystem jeannie
  :description "A wrapping of Jena for Armed Bear Common Lisp."
  :version "0.10.0"
  :defsystem-depends-on (abcl-asdf)
  :depends-on (simple-date-time
               alexandria)
  :components ((:module apache-jena :serial t :components
                        ((:mvn "org.apache.jena/jena-base/3.17.0")
                         (:mvn "org.apache.jena/jena-core/3.17.0")
                         (:mvn "org.apache.jena/jena-arq/3.17.0")))
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
                                     (:file "model")
                                     (:file "jena"))))
  :in-order-to ((asdf:test-op (asdf:test-op jeannie/test))))

(defsystem jeannie/tdb
  :description "Access to TDB triple store instances on local filesystem."
  :version "3.5.0"
  :defsystem-depends-on (abcl-asdf)
  :depends-on (jeannie)
  :components ((:module tdb :pathname "src/" :components
                        ((:mvn "org.apache.jena/jena-tdb/3.17.0")
                         (:file "tdb")))))

(asdf:defsystem jeannie/server/fuseki
  :description "Use of Fuseki Embedded server for managing SPARQL endpoints."
  :version "3.6.0"
  :defsystem-depends-on (abcl-asdf)
  :depends-on (jeannie/tdb)
  :components ((:module fuseki :components
                        ((:mvn "org.apache.jena/jena-fuseki-main/3.17.0")
			 (:mvn "org.apache.jena/jena-fuseki-webapp/3.17.0")
			 #+(or)
                         (:mvn "org.eclipse.jetty/jetty-util/jar:9.4.8.v20171121")
			 #+(or)
                         (:mvn "org.eclipse.jetty/jetty-server/9.4.8.v20171121")))
               (:module server :depends-on (fuseki) :pathname "src/"
                        :components ((:file "server")))))

(defsystem jeannie/server
  :depends-on (jeannie/server/fuseki))

(defsystem jeannie/test
  :version "0.9.0"
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
               (:module model :pathname "t/"
                        :depends-on (package)
                        :components ((:test-file "model")))
               (:module literals :pathname "t/"
                        :depends-on (package)
                        :components ((:test-file "literals")))
               (:module owl :pathname "t/"
                        :depends-on (package)
                        :components ((:test-file "owl-reasoner")))
               (:module sparql :pathname "t/"
                        :depends-on (package)
                        :components ((:test-file "sparql")))
               (:module json-ld :pathname "t/"
                        :depends-on (package)
                        :components ((:test-file "json-ld")))
               (:module t :depends-on (package)
                        :components ((:test-file "jeannie"))))
  :description "Test system for jeannie"
  :perform (asdf:test-op (op c)
                         (uiop:symbol-call :prove-asdf 'run-test-system c)))

