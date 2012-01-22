;;; -*- Mode: LISP; Syntax: COMMON-LISP -*-
(require 'asdf)
(in-package :asdf)
(defsystem :jeannie 
  :version "0.1"
  :documentation "A wrapping of Jena for Armed Bear Common Lisp."
  :components
  ((:module jena :components
            ((:mvn "com.hp.hpl.jena/arq" 
                   :version "2.8.5")))
   (:module doc :components
            ((:mvn "com.hp.hpl.jena/arq-doc" 
                   :version "2.8.5)))
   (:module package :pathname "" :depends-on (:jena) :components 
            ((:file "packages")))
   (:module src :components
            ((:file "java")
             (:file "jena" :depends-on ("java"))))))
  


   
            