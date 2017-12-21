(defpackage djini
  (:use :cl)
  (:nicknames :org.not.djini "DJINI")
  (:export

   #:stringify
   #:make-new-subject

   #:emit-rdf

   #:triple 
   #:construct  ;; construct a primitive RDF triple in memory

   #:*model* ;; special for current model being processed
           
   #:persist
   #:start-peer)) ;; unimplemented



