(in-package :cl-user)

(prove:plan 1)
(prove:ok
 (djini:write-rdf nil
                  `(:obj (("status" . 1) ("bar" . 1)))
                  nil)
 "Reading RDF from synthetic JSOWN object…")


(prove:plan 1)
(prove:ok
 (djini:write-rdf nil
                  "{\"1\": 2}"
                  nil)
 "Reading RDF source from JSON string…")

(prove:plan 1)
(prove:is-error 
 (djini:write-rdf nil
                  (asdf:system-relative-pathname :djini "src/djini/t/eg/tx-1.sexp")
                  nil)
 t
 "Reading RDF source from sexp database…")

(prove:finalize)

   
