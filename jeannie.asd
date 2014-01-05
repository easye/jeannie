;;; -*- Mode: LISP; Syntax: COMMON-LISP -*-
(require :asdf)
(require :abcl-contrib)
(require :abcl-asdf)

(ql:quickload :rt)

(asdf:defsystem :jeannie 
  :description "A wrapping of Jena for Armed Bear Common Lisp."
  :version "0.2.3" 
  :defsystem-depends-on (abcl-asdf)
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
  :description "Common Lisp-only local peer implementation."
  :version "0.0.2"
  :depends-on (jeannie 
;;			   restas cl-who parenscript drakma 
#+nil			   ironclad) ;; 
  :components ((:file "packages")
			   (:module src 
						:serial t 
						:components ((:file "rdf")
									 (:file "djini")))))




