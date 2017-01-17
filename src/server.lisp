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

(defparameter *last-server* nil)

(defun start-server (&key
                       directory
                       (path "/ds")
                       (port 3330))
  (let ((dataset
         (if directory
             (progn
               (format *standard-output* "~&Creating dataset under <file:~a>.~%" directory)
               (create-persistent-dataset directory)
             (create-memory-dataset))))
        (server-builder (#"create" 'FusekiEmbeddedServer)))
    (#"setPort" server-builder port)
    (#"add" server-builder path dataset)
    (let ((server (#"build" server-builder))
          (endpoint (format nil "http://127.0.0.1:~a~a" port path)))
      (#"start" server)
      (setf *last-server* server)
      (format *standard-output* "~&Started SPARQL endpoint at <~a>~%" endpoint)
      (values
       server
       endpoint))))

(defun stop-server (server)
  (#"stop" server))

(defun create-memory-dataset ()
  (#"createTxnMem" 'DatasetFactory))                            

(defun create-persistent-dataset (directory)
  (let ((d (pathname directory)))
    (#"createDataset" 'TDBFactory (namestring d))))

    
          
