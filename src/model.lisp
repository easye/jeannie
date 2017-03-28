(in-package :jeannie)

(defun make-memory-model ()
  "Make a new default Jena model in memory."
  (#"createDefaultModel" 'ModelFactory))

;;; TODO check that a model actually references a model
(defmacro with-ensured-model ((model) &body body)
  `(progn
     (unless ,model
       (setf ,model (make-memory-model)))
     ,@body))

(defun create-property (model url)
  (check-type url ext:url-pathname)
  ;;; handle

  ;;; http://example.org/a/b/property  --> ns "http://example.org/a/b/"
  (with-ensured-model (model)
    (let (namespace property)
      (if (not (null (ext:url-pathname-fragment url)))
          ;; http://example.org/a/b#property  --> ns "http://example.org/a/b#"
          (let ((ns (make-pathname :defaults url))
                (fragment (ext:url-pathname-fragment url)))
            (setf (ext:url-pathname-fragment ns) nil)
            (setf namespace (format nil "~a#" (namestring ns))
                  property fragment))
          (setf namespace (namestring (make-pathname :defaults url
                                                     :name nil :type nil))
                property (namestring (make-pathname :defaults url
                                                    :device nil :host nil :directory nil))))
      (#"createProperty" model namespace property))))




