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

(defun jstream (file)
  "For a pathname named in FILE, return a Java java.io.InputStreamReader"
  (handler-case
      (let* ((pathname (namestring (merge-pathnames file)))
	     (file-input-stream (jss:new 'FileInputStream pathname))
	     (input-stream-reader (jss:new 'InputStreamReader
						file-input-stream)))
	(verbose "Opened '~A' for read." file)
	input-stream-reader)
    ;;; XXX Fix java exception hierarchy
    (java-throwable (e)
	(error "Failed to load file '~S' because of throwable: ~A"
	       file e))
    (java-exception (e)
	(error "Failed to load file '~S' because of exception: ~A"
	       file e))))
