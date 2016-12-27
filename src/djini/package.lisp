(defpackage :djini
  (:use :cl :jeannie)
  (:nicknames :org.not.djini "DJINI")
  (:export #:triple 
		   #:construct  ;; construct a primitive RDF triple in memory

		   #:*model* ;; special for current model being processed

		   #:persist
		   #:start-peer)) ;; unimplemented



