;;; -*- Mode: LISP; Syntax: COMMON-LISP -*-
(require 'asdf)
(in-package :asdf)

(defsystem :jeannie 
  :version "0.1"
;; XXX  :documentation "A wrapping of Jena for Armed Bear Common Lisp."
  :components ;; http://www.openjena.org/wiki/Maven
  ((:module jena :components
            ((:mvn "com.hp.hpl.jena/arq" 
                   :version "2.8.5")))
   ;; (:module doc :components
   ;;          ((:mvn "com.hp.hpl.jena/jena-javadoc" 
   ;;                 :version "2.6.4")))
   ;; (:module jena-src :components
   ;;          ((:mvn "com.hp.hpl.jena/jena-sources" 
   ;;                 :version "2.6.4")))
   (:module package :pathname "" :depends-on (:jena) :components 
            ((:file "packages")))
   (:module src :components
            ((:file "java")
             (:file "jena" :depends-on ("java"))))))
  
;;; Symbol in this package are pure Common Lisp 
(defsystem :djini
  :version "1.0" :components
  ((:module src :components
            ((:file "rdf")))))

            