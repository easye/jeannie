(in-package :jeannie/test)

#+nil
(let* ((namespace "https://example.org/2006/test")
       (statement (loop :for type :in '(subject object predicate)
			:collecting (format nil "~a/~a" namespace type))))
  (plan 1)
  (prove:ok (affirm (first statement) (second statement) (third statement))))

#+nil
(let ((statements '(("http://example.com/person/doe/jane"
                     ("http://xmlns.com/foaf/0.1/" "name")
                     "Jane Doe")
                    ("http://example.com/person/doe/jane"
                     #p"http://xmlns.com/foaf/0.1/"
                     "name")))
      (path (ext:make-temp-directory)))
  (diag (format nil
                "Asserting statement in persistent model at '~a'" path))
  (plan (* (length statements) 2))
  (loop
     :with affirmed = 0
     :for (subject predicate object) :in statements
     :doing (let ((model
                   (if (consp predicate)
                       (let ((namespace (first predicate))
                             (predicate (second predicate)))
                         (jeannie:affirm subject
                                         predicate
                                         object
                                         :path path :namespace namespace))
                       (jeannie:affirm subject
                                       predicate
                                       object
                                       :path path))))
              (ok model)
              (incf affirmed)
	      (ok (= (#"size" model) affirmed)))))


(finalize)

         

        
