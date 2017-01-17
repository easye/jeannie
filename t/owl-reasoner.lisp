(in-package :jeannie/test)

(plan 4)

(ok (jeannie::get-reasoner :type "OWL"))

(let ((model (read-rdf (asdf:system-relative-pathname :jeannie "t/people.n3"))))
  (let ((inferred-model (jeannie::inferred-model model)))
    (ok model)
    (ok inferred-model)
    (ok
     (list-statements inferred-model :subject "http://example.org/mark"))))

(finalize)
