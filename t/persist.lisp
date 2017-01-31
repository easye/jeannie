(in-package :jeannie/test)

(plan 2)

(let ((subject "http://example.com/person/doe/jane")
      (namespace "http://xmlns.com/foaf/0.1/")
      (predicate "name")
      (object "Jane Doe")
      (path (ext:make-temp-directory)))
  (diag (format nil
                "Asserting statement in persistent model at '~a'" path))
  (let ((model (affirm subject predicate object :path path :namespace namespace)))
    (ok model)
    (ok (= (#"size" model) 1))))

(finalize)

         

        
