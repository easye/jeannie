(when (asdf:find-system :abcl)
    (prove:diag "Conditionalized testing of ABCL model triggered.")
    (prove:plan 1)
    (let ((path (asdf:system-relative-pathname :abcl "abcl.rdf")))
      (prove:ok
       (jeannie:read-rdf path :format :n3)
       (format nil
                "Able to parse ~a as N3 triples" path))))

(let ((uri #p"https://abcl.org/svn/tags/1.9.0/abcl.rdf"))
  (prove:plan 1)
  (prove:ok
   (jeannie:read-rdf uri :format :n3)
       (format nil
               "Able to parse <~a> as N3 triples"
               (namestring uri))))

(prove:finalize)  


