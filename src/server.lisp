#|
<https://jena.apache.org/documentation/fuseki2/fuseki-embedded.html>

Example 1

Create a server on port 3330, that provides the default set of
endpoints for an RDF dataset that can be updated via HTTP.

DatasetGraph ds = DatasetFactory.createTxnMem() ;
FusekiEmbeddedServer server = FusekiEmbeddedServer.create()
    .add("/ds", ds)
    .build() ;
server.start() ;
...
server.stop() ;

|#

(in-package :jeannie/server)

(defparameter *servers* (make-hash-table)
  "All Fuseki instances we see in the lifetime of the process executing this code.")

(defun running-instances (server)
  (let ((it (gethash server *servers*)))
    (if it
        it
        (progn
          (warn "No such server instance ~a has been started." server)
          0))))

(defun start (&key
                directory
                (context-path "/ds")
                (port 3330))
  "Start a FusekiEmbeddedServer instance running on PORT with persistence under DIRECTORY served from CONTEXT-PATH."
  (let ((dataset
         (if directory
             (progn
               (format *standard-output* "~&Creating dataset under <file:~a>.~%" directory)
               (ensure-persistent-dataset directory)
             (make-memory-dataset))))
        (server-builder (#"create" 'FusekiEmbeddedServer)))
    (#"setPort" server-builder port)
    (#"add" server-builder context-path dataset)
    (let ((server (#"build" server-builder))
          (endpoint (format nil "http://127.0.0.1:~a~a" port context-path)))
      (#"start" server)
      (if (not (gethash server *servers*))
          (setf (gethash server *servers*) 1)
          (progn
            (warn "Inconsistent start on already running server instance ~a requested." server)
            (setf (gethash server *servers*)
                  (incf (gethash server *servers*)))))
      (format *standard-output* "~&Started SPARQL endpoint at <~a>~%" endpoint)
      (values
       server
       endpoint))))

(defun stop (server)
  "Stop an instance of a previously created Fuseki SERVER."
  (note "~&Stopping Fuseki ~a instance with ~a outstanding instances."
        server
        (gethash server *servers*))
  (#"stop" server)
  (decf (gethash server *servers*)))



    
          
