# Jeannie

An encapsulation of Apache Jena in Common Lisp

## Usage

## Installation


## Bugs

### Fuseki Embedded doesn't have the nice endpoints

What invoking ```fuseki-server``` boils down to:

#### JSS
```
(#"main" 'org.apache.jena.fuseki.cmd.FusekiCmd (java:jarray-from-list '("")))
; Evaluation aborted on #<JAVA-EXCEPTION java.lang.NoClassDefFoundError: org/apache/jena/fuseki/cmd/FusekiCmd$FusekiCmdInner {1AE2263D}>.
``` 

#### JAVA
```
(java:jstatic "main" "org.apache.jena.fuseki.cmd.FusekiCmd" (java:jarray-from-list '("")))
                  
; Evaluation aborted on #<JAVA-EXCEPTION java.lang.NoClassDefFoundError: org/apache/jena/fuseki/cmd/FusekiCmd$FusekiCmdInner {2CB152D}>.
```
