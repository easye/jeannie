(in-package :jeannie/test)

(plan 3)

(ok
 (index))

(ok
 (read-rdf (asdf:system-relative-pathname :jeannie "t/tests.n3"))
 (mapcar #"toString"
         (loop :with iterator = (#"listObjects" *model*)
            :while (#"hasNext" iterator)
            :collect (#"next" iterator))))


(ok
 (read-rdf (asdf:system-relative-pathname :jeannie "t/bfo.owl")
           :format "rdf/xml"))

(finalize)