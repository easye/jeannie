(in-package :jeannie/test)

(plan 9)

(let* ((d (ext:make-temp-directory))
       (port (+ 1024 (random (- (expt 2 15) 1024)))))
  (multiple-value-bind (server uri)
      (jeannie::start-server :directory d :port port)
    (ok server)
    (is (jeannie::running-instances server)
        1)
    (ok uri)
    (let ((update-query (#"read" 'UpdateFactory
                                 (namestring 
                                  (asdf:system-relative-pathname :jeannie "t/eg/update.sparql")))))
      (ok update-query)
      (ok 
       (#"createRemote" 'UpdateExecutionFactory update-query uri))
      (let ((query (#"create" 'QueryFactory "SELECT ?s ?p ?o WHERE {?s ?p ?o}")))
        (ok query)
        (ok (#"sparqlService" 'QueryExecutionFactory uri query))))
    (jeannie:stop-server server)
    (is (jeannie::running-instances server)
        0)))


(finalize)

            
