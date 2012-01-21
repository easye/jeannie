#| Loading Jeanine test results

Test
----

   CL-USER> (asdf:load-system :jeannie)
   ; Loading /home/evenson/work/jeannie/jeannie.asd ...
   ; Loaded /home/evenson/work/jeannie/jeannie.asd (0.019 seconds)
   ; Compiling /home/evenson/work/jeannie/packages.lisp ...
   ; (DEFPACKAGE :JEANNIE ...)
   ; (IN-PACKAGE :JEANNIE)
   ; (DEFUN INDEX ...)
   ; Wrote /home/evenson/.cache/common-lisp/abcl-1.1.0-dev-fasl38-solaris-x64/home/evenson/work/jeannie/ASDF-TMP-packages.abcl (0.041 seconds)
   ; Loading /home/evenson/.cache/common-lisp/abcl-1.1.0-dev-fasl38-solaris-x64/home/evenson/work/jeannie/packages.abcl ...
   ; Loaded /home/evenson/.cache/common-lisp/abcl-1.1.0-dev-fasl38-solaris-x64/home/evenson/work/jeannie/packages.abcl (0.0030 seconds)
   T
   CL-USER> (jeannie:index)
   WARNING: Using LATEST for unspecified version.
   "/home/evenson/.m2/repository/org/apache/jena/jena-arq/2.9.0-incubating/jena-arq-2.9.0-incubating.jar:/home/evenson/.m2/repository/org/apache/jena/jena-core/2.7.0-incubating/jena-core-2.7.0-incubating.jar:/home/evenson/.m2/repository/org/apache/jena/jena-iri/0.9.0-incubating/jena-iri-0.9.0-incubating.jar:/home/evenson/.m2/repository/commons-codec/commons-codec/1.5/commons-codec-1.5.jar:/home/evenson/.m2/repository/org/apache/httpcomponents/httpclient/4.1.2/httpclient-4.1.2.jar:/home/evenson/.m2/repository/org/slf4j/jcl-over-slf4j/1.6.4/jcl-over-slf4j-1.6.4.jar:/home/evenson/.m2/repository/org/apache/httpcomponents/httpcore/4.1.3/httpcore-4.1.3.jar:/home/evenson/.m2/repository/com/ibm/icu/icu4j/3.4.4/icu4j-3.4.4.jar:/home/evenson/.m2/repository/xerces/xercesImpl/2.10.0/xercesImpl-2.10.0.jar:/home/evenson/.m2/repository/xml-apis/xml-apis/1.4.01/xml-apis-1.4.01.jar:/home/evenson/.m2/repository/org/slf4j/slf4j-api/1.6.4/slf4j-api-1.6.4.jar:/home/evenson/.m2/repository/org/slf4j/slf4j-log4j12/1.6.4/slf4j-log4j12-1.6.4.jar:/home/evenson/.m2/repository/log4j/log4j/1.2.16/log4j-1.2.16.jar"
   CL-USER> 
   
|#
