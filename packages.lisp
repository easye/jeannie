#-abcl (error "Sorry, but this will only work with Armed Bear Common Lisp.")
#-abcl (warn "http://common-lisp.net/project/armedbear/")

(defpackage :jeannie
  (:use :cl :abcl-asdf)
  (:documentation "http://en.wikipedia.org/wiki/I_Dream_of_Jeannie")
  (:nicknames :jena)
  (:import-from :jss :new)
  (:export 
   #:read-rdf #:*model*
   #:index))

