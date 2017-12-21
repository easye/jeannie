(in-package :cl-user)

(prove:plan 1)
(prove:ok
 (djini:emit-rdf nil
                 `(:obj (("status" . 1) ("bar" . 1)))
                 nil)
 "Reading RDF from synthetic JSOWN object…")

(prove:plan 1)
(prove:ok
 (djini:emit-rdf nil
                 "{\"1\": 2}"
                 nil)
 "Reading RDF source from JSON string…")

(prove:plan 1)
(let ((p (asdf:system-relative-pathname :djini "src/djini/t/eg/etherscan.sexp")))
  (prove:ok
   (djini:emit-rdf nil p nil)
   (format nil "Reading RDF source from sexp database~%~t<file://~a>…" p)))

(prove:finalize)

   
