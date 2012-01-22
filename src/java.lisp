(in-package :jeannie)

;;; From abcld 
(defun jstream (file)
  "For a pathname for FILE, return a Java java.io.InputStreamReader"
  (handler-case
      (let* ((pathname (namestring (merge-pathnames file)))
	     (file-input-stream (cl-user::new 'FileInputStream pathname))
	     (input-stream-reader (cl-user::new 'InputStreamReader
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
