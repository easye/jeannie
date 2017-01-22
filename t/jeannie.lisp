(in-package :jeannie/test)

(plan 2)

(ok
 (let ((model (read-rdf (asdf:system-relative-pathname :jeannie "t/tests.n3"))))
   (mapcar #"toString"
           (loop :with iterator = (#"listObjects" model)
              :while (#"hasNext" iterator)
              :collect (#"next" iterator)))))

(let ((model (read-rdf "@prefix : <https://rdf.not.org/users/evenson/jeannie#> . :s :o :p .")))
  (is (java:jclass-of model)
      "org.apache.jena.rdf.model.impl.ModelCom"))

(ok
 (read-rdf (asdf:system-relative-pathname :jeannie "t/bfo.owl")
           :format "rdf/xml"))

(finalize)
