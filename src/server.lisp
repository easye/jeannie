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

(in-package :jeannie)

(defvar *server* nil)

(defun start-server (&key (port 3330))
  (when *server*
    (warn "Server already present: ~a" *server*))
  (let ((dataset (#"createTxnMem" 'DatasetFactory))
        (server-builder (#"create" 'FusekiEmbeddedServer)))
    (#"setPort" server-builder port)
    (#"add" server-builder "/ds" dataset)
    (let ((server (#"build" server-builder)))
      (#"start" server)
      (setf *server* server))))

(defun stop-server ()
  (unless *server*
    (error "No server present to stop."))
  (#"stop" *server*)
  (setf *server* nil))

  
    
          
    
  
