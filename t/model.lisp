(in-package :jeannie/test)

(plan 1)
(ok
 (jeannie:make-memory-model))

(plan 1)
(let (model)
  (jeannie:with-ensured-model (model)
    (ok model)))

(plan 4)
(let ((file (asdf:system-relative-pathname :jeannie "t/eg/tests.n3")))
  (let ((model (jeannie:read-rdf file :format :n3)))
    (ok (jeannie:list-statements model))
    (ok (jeannie:list-subjects model))
    (ok (jeannie:list-objects model))
    (ok (jeannie:list-namespaces model))))

(finalize)

