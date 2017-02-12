(in-package :jeannie/test)

(plan 1)
(diag "Testing that we can boot an OWL reasoner…")
(ok (jeannie:get-reasoner :type "OWL"))

(let ((model-file (asdf:system-relative-pathname :jeannie "t/eg/people.n3")))
  (plan 1)
  (diag "Testing existence of model file…")
  (ok (probe-file model-file))
  (let ((model (jeannie:read-rdf model-file :model nil :format :n3)))
    (plan 1)
    (diag "Testing whether in memory model was created…")
    (ok model)
    (when model
      (plan 1)
      (diag "Testing that an inferred model could be derived…")
      (let ((inferred-model (jeannie:inferred-model model)))
        (ok inferred-model)
        (when inferred-model
          (diag "Iterating statements from inferred model…")
          (let ((statements
                 (jeannie:list-statements inferred-model :subject "http://example.org/easye/")))
            (plan 1)
            (is (length statements) 0)))))))

(finalize)
