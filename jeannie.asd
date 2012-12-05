;;; -*- Mode: LISP; Syntax: COMMON-LISP -*-
(require :asdf)
(require :abcl-contrib)
(require :abcl-asdf)

(ql:quickload :rt)

(asdf:defsystem :jeannie 
  :description "A wrapping of Jena for Armed Bear Common Lisp."
  :version "0.2.1" 
  :depends-on (rt)
  :components ((:module jena :serial t :components
                        ((:mvn "org.apache.jena/jena-core")
                         (:mvn "org.apache.jena/jena-arq")))

                        ;; ((:mvn "com.hp.hpl.jena/arq/2.8.8" ))

               ;; (:module doc :components
               ;;          ((:mvn "com.hp.hpl.jena/jena-javadoc" 
               ;;                 :version "2.6.4")))
               ;; (:module jena-src :components
               ;;          ((:mvn "com.hp.hpl.jena/jena-sources" 
               ;;                 :version "2.6.4")))
               (:module package :pathname "" :depends-on (:jena) 
                        :components ((:file "packages")))
               (:module test :depends-on (src) 
                        :components ((:file "tests")
                                     (:static-file "tests.n3")))
               (:module src :components ((:file "java")
                                         (:file "index")
                                         (:file "jena" :depends-on ("java"))))))

(defmethod asdf:perform ((o test-op) (c (eql (find-system :jeannie))))
  (funcall (intern (symbol-name 'do-tests) (find-package 'rt))))

;;; FIXME Should NOT be neceessary
(defmethod asdf:perform ((o load-op) (c (eql (find-system :jeannie))))
  (java:add-to-classpath (abcl-asdf:as-classpath
                          (abcl-asdf:resolve-dependencies 
                           "org.apache.jena" "jena-arq" "2.9.3"))))

;;; Everything in this package is pure Common Lisp
(asdf:defsystem :djini
  :version "0.1" 
  :depends-on (jeannie)
  :components ((:module src :components ((:file "rdf")))))


