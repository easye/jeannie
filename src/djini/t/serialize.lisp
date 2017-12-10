(in-package :cl-user)

(prove:plan 1)

(prove:ok
 (djini:write-rdf (jsown:parse "{\"1\": 2}")))

(prove:finalize)

   
