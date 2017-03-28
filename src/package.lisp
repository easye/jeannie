#-abcl (error "Sorry, but this will only work with Armed Bear Common Lisp.")
#-abcl (warn "http://common-lisp.net/project/armedbear/")

(in-package :cl-user)

(defpackage :jeannie
  (:use :cl :abcl-asdf)
  (:documentation "http://en.wikipedia.org/wiki/I_Dream_of_Jeannie")
  (:nicknames :jena)
  (:import-from :jss :new)
  (:export 

   #:read-rdf 

   ;;; TODO:  implement enough to not reference spcial
   #:*model* 

   #:parse

   #:get-reasoner #:inferred-model

   #:note

   #:affirm #:snapshot

   #:jstream ;; TODO: move me somewhere else

   #:make-memory-model #:with-ensured-model
   #:create-property

   #:make-memory-dataset #:ensure-persistent-dataset

   #:make-literal

   #:list-namespaces #:list-objects #:list-subjects #:list-statements

   #:index))

(defpackage :jeannie/server
  (:use :cl :jeannie)
  (:export 
   #:start #:stop
   ;;; TODO: implement enough to not reference spcial
   #:running-instances #:*servers*)) 
   
(defpackage :org.not.djini
  (:use :cl :jeannie)
  (:nicknames :djini)
  (:export #:triple 
           #:construct  ;; make primitive RDF triple 
           
           #:*model*
           
           #:persist
           #:start-peer)) ;; unimplemented



