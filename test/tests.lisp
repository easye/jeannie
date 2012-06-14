(in-package :jeannie)
(rt:deftest jeannie.read-rdf.1
    (#"toString"
     (read-rdf (asdf:system-relative-pathname :jeannie "test/tests.n3")))
  t)

    
