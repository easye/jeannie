(in-package :jeannie/test)

(plan 4)

(ok (jeannie:get-reasoner :type "OWL"))

(let ((model (read-rdf (asdf:system-relative-pathname :jeannie "t/eg/people.n3"))))
  (let ((inferred-model (jeannie:inferred-model model)))
    (diag "Testing whether in memory model was created…")
    (ok model)
    (diag "Testing that an inferred model could be derived…")
    (ok inferred-model)
    (diag "Iterating statements from inferred model…")
    (ok
     (let ((statements
            (jeannie:list-statements inferred-model :subject "http://example.org/easye/")))
       (and
        statements
        (> (length statements) 0))))))

(finalize)
