(in-package :jeannie/test)

(plan 2)
(let ((path (asdf:system-relative-pathname :jeannie "t/eg/tests.n3")))
  (diag (format nil "Testing reading RDF from '~a'." path))
  (let ((model (read-rdf path)))
    (is (java:jclass-of model)
        "org.apache.jena.rdf.model.impl.ModelCom")
    (ok 
     (mapcar #"toString"
             (loop :with iterator = (#"listObjects" model)
                :while (#"hasNext" iterator)
                :collect (#"next" iterator))))))

(plan 1)
(diag "Testing reading RDF from string…")
(let ((model (read-rdf "@prefix : <https://rdf.not.org/users/evenson/jeannie#> . :s :o :p .")))
  (is (java:jclass-of model)
      "org.apache.jena.rdf.model.impl.ModelCom"))

(plan 1)
(let ((path (asdf:system-relative-pathname :jeannie "t/eg/bfo.owl")))
  (diag (format nil "Testing reading of RDF/XML serialization from '~a'…" path))
  (is (java:jclass-of (read-rdf path :format "rdf/xml"))
      "org.apache.jena.rdf.model.impl.ModelCom"))

(finalize)
