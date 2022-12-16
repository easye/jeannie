(in-package :jeannie/test/server)


(let* ((d (ext:make-temp-directory))
       (port (+ 1024 (random (- (expt 2 15) 1024)))))
  (plan 3)
  (diag (format nil "Starting SPARQL endpoint on port ~a." port))
  (multiple-value-bind (server uri)
      (jeannie/server:start :directory d :port port)
    (ok server)
    (is (jeannie/server:running-instances server)
        1)
    (ok uri)
    (let ((update-query-file (asdf:system-relative-pathname :jeannie "t/eg/update.sparql"))
          (query-text "SELECT ?s ?p ?o WHERE {?s ?p ?o}"))
      (plan 2)
      (diag (format nil "Testing SPARQL update from ~a." update-query-file))
      (let ((update-query
             (#"read" 'UpdateFactory (namestring update-query-file))))
        (ok update-query)
        (ok 
         (#"createRemote" 'UpdateExecutionFactory update-query uri))
        (diag (format nil "Testing SPARQL query '~a'." query-text))
        (plan 2)
        (let ((query-execution
                (ignore-errors (#"sparqlService" 'QueryExecutionFactory
                                                 uri
                                                 query-text
                                                 (#"createDefault" 'org.apache.http.impl.client.HttpClients)))))
          (ok query-execution
              "Able to query SPARQL from current execution factory…") 
          (is-error 
           (let ((result-set (#"execSelect" query-execution)))
             (ok result-set
                 "Able to select from SPARQL query…"))
           t))))
    (plan 1)
    (diag "Stopping SPARQL endpoint.")
    (jeannie/server:stop server)
    (is (jeannie/server:running-instances server)
        0)))

(finalize)

            
