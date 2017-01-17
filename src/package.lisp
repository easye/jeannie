#-abcl (error "Sorry, but this will only work with Armed Bear Common Lisp.")
#-abcl (warn "http://common-lisp.net/project/armedbear/")

(defpackage :jeannie
  (:use :cl :abcl-asdf)
  (:documentation "http://en.wikipedia.org/wiki/I_Dream_of_Jeannie")
  (:nicknames :jena)
  (:import-from :jss :new)
  (:export 
   #:read-rdf 
   
   #:*model*

   #:parse

   #:get-reasoner

   #:list-namesaces #:list-objects #:list-subjects #:list-statements

   #:index))

(defpackage :org.not.djini
  (:use :cl :jeannie)
  (:nicknames "DJINI")
  (:export #:triple 
		   #:construct  ;; make primitive RDF triple 

		   #:*model*

		   #:persist
		   #:start-peer)) ;; unimplemented



