(in-package :cl-user)

(defpackage jeannie/test
  (:use #:cl #:jeannie #:prove)
  (:nicknames jeannie-test))

(defpackage jeannie/test/server
  (:use #:cl #:jeannie #:prove)
  (:nicknames jeannie-test-server))
