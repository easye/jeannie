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


(let (model)
  (jeannie:with-ensured-model (model)
    (let ((properties '(#p"http://example.org/ns#property"
                        #p"http://example.org/ns/as/directories/property"
                        #p"http://example.org/ns/as/directories#property")))
      (plan (length properties))
      (dolist (property properties)
        (like
         (java:jclass-of
          (jeannie:create-property model property))
         "org.apache.jena.rdf.model.impl.PropertyImpl")))))
  
(finalize)

