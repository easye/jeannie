(in-package :cl-user)

(prove:plan 2)
(prove:ok (djini:make-new-subject nil))
(prove:ok (djini:make-new-subject "kilroy"))

(prove:finalize)
