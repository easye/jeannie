(in-package :cl-user)

(prove:plan 1)
(let ((u #p"https://raw.githubusercontent.com/parallele-at/covid/master/eg/covid.n3"))
  (prove:ok (jeannie:read-rdf u)))

(prove:finalize)

  


