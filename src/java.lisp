(in-package :jeannie)

;;; From abcld 

(defvar *verbose* nil
  "When set, *VERBOSE* indicates the stream to log verbose messages to.")

;;; c.f. http://nklein.com/2011/04/delayed-evaluation-across-packages/
;;;
;;; The question is whether creating a closure is generally cheaper
;;; than evaluating arguments to FORMAT?
(defmacro verbose (message &rest parameters)
  `(when *verbose*
     (format *verbose* (funcall (lambda() (format nil ,message ,@parameters))))
     (finish-output *verbose*)))

(defun jstream (thing)
  "For THING return a Java java.io.InputStreamReader

THING can be a URL-PATHNAME, PATHNAME or a open stream"
  (handler-case
      (let ((input-stream
              (typecase thing
                (ext:url-pathname
                 (input-stream-from-uri thing))
                (system:url-stream
                 (#"getInputStream" thing))
                (t
                 (jss:new 'java.io.FileInputStream (namestring thing))))))
        (unless input-stream
          (error "Not able to get a java.io.InputStream from ~a" thing))
	(verbose "Opened '~A' for read." thing)
        (jss:new 'java.io.InputStreamReader input-stream))
    (java:java-exception (e)
      (error "Failed to load '~S' because of throwable: ~A"
             thing e))))

(defun input-stream-from-uri (uri)
  (let ((url-stream (SYSTEM:MAKE-FILE-STREAM (pathname uri)
                                             (namestring uri)
                                             'character :input nil :default)))
    (handler-case
        (#"getInputStream" url-stream)
      (java:java-exception (e)
        (error "Failed to open URI '~s' due to implementation missing an unreleased feature URLStream.getInputStream()")))))


