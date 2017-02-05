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

   ;;; TODO: 
   #:*model* implement enough to not reference spcial

   #:parse

   #:get-reasoner #:inferred-model

   #:note

   #:affirm #:snapshot

   #:create-memory-dataset #:create-persistent-dataset

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
  (:nicknames "DJINI")
  (:export #:triple 
           #:construct  ;; make primitive RDF triple 
           
           #:*model*
           
           #:persist
           #:start-peer)) ;; unimplemented



