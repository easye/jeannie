(in-package :jeannie)

(defun index () 
  "Return the index of locally cached Jena jars that will be used"
  ;;; TODO use these libraries in the ASDF definition.
  (abcl-asdf:resolve-dependencies "org.apache.jena" "jena-arq"))

(defgeneric parse ((object t)))

(defmethod parse ((namestring string))
  (read-rdf namestring))

  
