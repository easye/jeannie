#-abcl (error "Sorry, but this will only work with Armed Bear Common Lisp.")
#-abcl (warn "http://common-lisp.net/project/armedbear/")

(defpackage :jeannie
  (:use :cl :abcl-asdf :jss)
  (:documentation "http://en.wikipedia.org/wiki/I_Dream_of_Jeannie")
  (:nicknames :jena)
  (:export 
   #:read-rdf
   #:index))


(in-package :jeannie)

(defun index () 
  "Return the index of locally cached Jena jars that will be used"
  ;;; TODO use these libraries in the ASDF definition.
  (abcl-asdf:resolve-dependencies "org.apache.jena" "jena-arq"))
