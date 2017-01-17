(in-package :jeannie)

(defgeneric parse ((object t)))

(defmethod parse ((namestring string))
  (read-rdf namestring))

  
