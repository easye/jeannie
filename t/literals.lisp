(in-package :jeannie/test)

(plan 2)
(diag "Testing the creation of string literal…")
(let ((source "let there be … a Ümgebung!"))
  (multiple-value-bind (literal model)
      (jeannie:make-literal source)
    (ok literal)
    (like (#"toString" literal) source)))

(finalize)

  

  
