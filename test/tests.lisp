(in-package :jeannie)

(rt:deftest jeannie.index.1
    (index)
  t)

(rt:deftest jeannie.read-rdf.1
    (#"toString"
     (read-rdf (asdf:system-relative-pathname :jeannie "test/tests.n3")))
  t)

;;; XXX needs to have run JEANNIE.READ-RDF.1 to initialize *MODEL*
(rt:deftest jeannie.model.1
    (mapcar #"toString" (loop :with iterator = (#"listObjects" *model*) :while (#"hasNext" iterator) :collect (#"next" iterator)))
  t)

    
