;;; -*- Mode: LISP; Syntax: COMMON-LISP -*-
(in-package :asdf)
(asdf:defsystem :djini
  :description "Common Lisp-only local peer implementation."
  :version "0.0.1"
  :depends-on (restas cl-who parenscript drakma)
  :components ((:module src :components ((:file "djini")))))


