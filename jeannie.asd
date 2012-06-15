;;; -*- Mode: LISP; Syntax: COMMON-LISP -*-

(asdf:defsystem :jeannie 
  :version "0.1"
;; XXX  :documentation "A wrapping of Jena for Armed Bear Common Lisp."
  :depends-on (jss rt)
  :components ;; http://www.openjena.org/wiki/Maven
  ((:module jena :components
            ((:mvn "org.apache.jena/jena-arq"))
            #+nil
            ((:mvn "com.hp.hpl.jena/arq/2.8.8" )))

   ;; (:module doc :components
   ;;          ((:mvn "com.hp.hpl.jena/jena-javadoc" 
   ;;                 :version "2.6.4")))
   ;; (:module jena-src :components
   ;;          ((:mvn "com.hp.hpl.jena/jena-sources" 
   ;;                 :version "2.6.4")))
   (:module package :pathname "" :depends-on (:jena) :components 
            ((:file "packages")))
   (:module test :depends-on (src) :components
           ((:file "tests")
            (:static-file "tests.n3")))
   (:module src :components
            ((:file "java")
             (:file "index")
             (:file "jena" :depends-on ("java"))))))
  
;;; Symbol in this package are pure Common Lisp 
(asdf:defsystem :djini
  :version "1.0" :components
  ((:module src :components
            ((:file "rdf")))))

            
