;;; -*- Mode: LISP; Syntax: COMMON-LISP -*-
(require 'asdf)
(in-package :asdf)

;;; Everything in this package is pure Common Lisp
(defsystem :djini
  :version "0.1" :components
  ((:module src :components 
            ((:file "rdf")))))

(defsystem :jeannie 
;;  :documentation "A wrapping of Jena for Armed Bear Common Lisp."
  :version "0.1" :components
  ((:module jena :components
            ((:mvn "com.hp.hpl.jena/arq" :version "2.8.5")))
   (:module src :pathname "" :depends-on (:jena) :components 
            ((:file "packages")))))
  

            