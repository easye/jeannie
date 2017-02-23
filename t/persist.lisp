(in-package :jeannie/test)

(plan 2)

(let ((subject #p"http://example.com/person/doe/jane")
      (predicate #p"http://xmlns.com/foaf/0.1/name")
      (object "Jane Doe")
      (path (ext:make-temp-directory)))
  (diag (format nil
                "Asserting statements in persistent model at '~a'" path))
  (let ((model (jeannie:affirm subject predicate object :path path)))
    (ok model)
    (ok (= (#"size" model) 1))))

(finalize)

         

        
