;;; -*- Mode: LISP; Syntax: COMMON-LISP -*-
(require :asdf)
(require :abcl-contrib)
(require :abcl-asdf)

(ql:quickload :rt)

(asdf:defsystem :jeannie 
  :description "A wrapping of Jena for Armed Bear Common Lisp."
  :version "0.2.2" 
  :depends-on (rt)
  :components ((:module jena :serial t :components
                        ((:mvn "org.apache.jena/jena-core")
                         (:mvn "org.apache.jena/jena-arq")))
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

;;; Everything in this package is pure Common Lisp
(asdf:defsystem :djini
  :version "0.1" 
  :depends-on (jeannie)
  :components ((:module src :components ((:file "rdf")))))


