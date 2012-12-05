Jeannie
=======

A wrapping of Jena in Common Lisp.

## Usage

1.  Add to ASDF
    
        cmd$ mkdir -p ~/.asdf-install-dir/systems/
        cmd$ ln -s jeannie.asd ~/.asdf-install-dir/systems/
        cmd$ abcl --noinit --noinform  --eval "(dolist (s '(:abcl-contrib \
              :asdf-install :jeannie)) (require s))
        CL-USER>
    
2.  Show INDEX of available functions

        CL-USER> (jeannine:index)
    
3.  Read RDF from an N3 source resolvable via PATHNAME.    

        CL-USER> (jeannie:read-rdf "~/work/jeannie/test/tests.n3")

## Test 

### Results

Doing 3 pending tests of 3 tests total.
Test JEANNIE::JEANNIE.READ-RDF.1 failed
Form: ((LAMBDA (#:G6305 &REST #:G6306)
         (JSS:INVOKE-RESTARGS "toString" #:G6305 #:G6306 NIL))
       (JEANNIE:READ-RDF (ASDF:SYSTEM-RELATIVE-PATHNAME :JEANNIE
                                                        "test/tests.n3")))
Expected value: T
Actual value: "<ModelCom   {27c1d72e:13b6b55f542:-7ff8 @rdf:rest 27c1d72e:13b6b55f542:-7ff7; 27c1d72e:13b6b55f542:-7ff8 @rdf:first jeannie:read-rdf; 27c1d72e:13b6b55f542:-7ffb @rdf:rest 27c1d72e:13b6b55f542:-7ffa; 27c1d72e:13b6b55f542:-7ffb @rdf:first :jeannie; 27c1d72e:13b6b55f542:-7ff6 @rdf:rest 27c1d72e:13b6b55f542:-7ff5; 27c1d72e:13b6b55f542:-7ff6 @rdf:first asdf:system-relative-pathname; 27c1d72e:13b6b55f542:-7ffe @rdf:rest 27c1d72e:13b6b55f542:-7ffd; 27c1d72e:13b6b55f542:-7ffe @rdf:first jeannie:read-rdf; 27c1d72e:13b6b55f542:-7ff4 @rdf:rest rdf:nil; 27c1d72e:13b6b55f542:-7ff4 @rdf:first \"test/tests.n3\"; 27c1d72e:13b6b55f542:-7ff9 @dc:label \"The null prototype of the first test.\"; 27c1d72e:13b6b55f542:-7ff9 @rdf:first rt:do-tests; 27c1d72e:13b6b55f542:-7ffc @rdf:rest 27c1d72e:13b6b55f542:-7ffb; 27c1d72e:13b6b55f542:-7ffc @rdf:first asdf:system-relative-pathname; https://jena.not.org/test/users/evenson/1 @rdf:first 27c1d72e:13b6b55f542:-7ff8; https://jena.not.org/test/users/evenson/1 @rdf:first 27c1d72e:13b6b55f542:-7ffe; 27c1d72e:13b6b55f542:-7ff7 @rdf:rest rdf:nil...} | >".
Test JEANNIE::JEANNIE.MODEL.1 failed
Form: (MAPCAR (LAMBDA (#:G6320 &REST #:G6321)
                (JSS:INVOKE-RESTARGS "toString" #:G6320 #:G6321 NIL))
              (LOOP :WITH JEANNIE::ITERATOR =
                          ((LAMBDA (#:G6322 &REST #:G6323)
                             (JSS:INVOKE-RESTARGS "listObjects"
                                                  #:G6322
                                                  #:G6323
                                                  NIL))
                           JEANNIE:*MODEL*)
                    :WHILE ((LAMBDA (#:G6324 &REST #:G6325)
                              (JSS:INVOKE-RESTARGS "hasNext"
                                                   #:G6324
                                                   #:G6325
                                                   NIL))
                            JEANNIE::ITERATOR)
                    :COLLECT ((LAMBDA (#:G6326 &REST #:G6327)
                                (JSS:INVOKE-RESTARGS "next"
                                                     #:G6326
                                                     #:G6327
                                                     NIL))
                              JEANNIE::ITERATOR)))
Expected value: T
Actual value: ("http://www.w3.org/1999/02/22-rdf-syntax-ns#nil"
               "27c1d72e:13b6b55f542:-7ff8"
               "27c1d72e:13b6b55f542:-7ffb"
               "27c1d72e:13b6b55f542:-7ff6" "test/tests.n3"
               "http://abcl.org/require/asdf#system-relative-pathname"
               "The null prototype of the first test."
               "27c1d72e:13b6b55f542:-7ffe"
               "https://bitbucket.org/easye/jeannie#index.not.orgread-rdf"
               "27c1d72e:13b6b55f542:-7ff4"
               "27c1d72e:13b6b55f542:-7ffc"
               "http://evenson.not.org/quicklisp/rt#do-tests"
               "27c1d72e:13b6b55f542:-7ff7"
               "27c1d72e:13b6b55f542:-7ffa"
               "urn:common-lisp:package:keywordjeannie"
               "27c1d72e:13b6b55f542:-7ff5"
               "27c1d72e:13b6b55f542:-7ffd").
; Caught SIMPLE-WARNING:
;   Using LATEST for unspecified version.

METADATA_RESOLVING org.apache.jena:jena-arq/maven-metadata.xml @ /home/evenson/.m2/repository (enhanced)
METADATA_RESOLVED org.apache.jena:jena-arq/maven-metadata.xml @ /home/evenson/.m2/repository (enhanced)
METADATA_RESOLVING org.apache.jena:jena-arq/maven-metadata.xml @ central (http://repo1.maven.org/maven2/, releases+snapshots)
METADATA_DOWNLOADING org.apache.jena:jena-arq/maven-metadata.xml @ central (http://repo1.maven.org/maven2/, releases+snapshots)
METADATA_DOWNLOADED org.apache.jena:jena-arq/maven-metadata.xml (/home/evenson/.m2/repository/org/apache/jena/jena-arq/maven-metadata-central.xml) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
METADATA_RESOLVED org.apache.jena:jena-arq/maven-metadata.xml (/home/evenson/.m2/repository/org/apache/jena/jena-arq/maven-metadata-central.xml) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.jena:jena-arq:pom:2.9.4
ARTIFACT_RESOLVED org.apache.jena:jena-arq:pom:2.9.4 (/home/evenson/.m2/repository/org/apache/jena/jena-arq/2.9.4/jena-arq-2.9.4.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.jena:jena-parent:pom:4
ARTIFACT_RESOLVED org.apache.jena:jena-parent:pom:4 (/home/evenson/.m2/repository/org/apache/jena/jena-parent/4/jena-parent-4.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache:apache:pom:10
ARTIFACT_RESOLVED org.apache:apache:pom:10 (/home/evenson/.m2/repository/org/apache/apache/10/apache-10.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.jena:jena-core:pom:2.7.4
ARTIFACT_RESOLVED org.apache.jena:jena-core:pom:2.7.4 (/home/evenson/.m2/repository/org/apache/jena/jena-core/2.7.4/jena-core-2.7.4.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.jena:jena-parent:pom:4
ARTIFACT_RESOLVED org.apache.jena:jena-parent:pom:4 (/home/evenson/.m2/repository/org/apache/jena/jena-parent/4/jena-parent-4.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache:apache:pom:10
ARTIFACT_RESOLVED org.apache:apache:pom:10 (/home/evenson/.m2/repository/org/apache/apache/10/apache-10.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.jena:jena-iri:pom:0.9.4
ARTIFACT_RESOLVED org.apache.jena:jena-iri:pom:0.9.4 (/home/evenson/.m2/repository/org/apache/jena/jena-iri/0.9.4/jena-iri-0.9.4.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.jena:jena-parent:pom:4
ARTIFACT_RESOLVED org.apache.jena:jena-parent:pom:4 (/home/evenson/.m2/repository/org/apache/jena/jena-parent/4/jena-parent-4.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache:apache:pom:10
ARTIFACT_RESOLVED org.apache:apache:pom:10 (/home/evenson/.m2/repository/org/apache/apache/10/apache-10.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.slf4j:slf4j-api:pom:1.6.4
ARTIFACT_RESOLVED org.slf4j:slf4j-api:pom:1.6.4 (/home/evenson/.m2/repository/org/slf4j/slf4j-api/1.6.4/slf4j-api-1.6.4.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.slf4j:slf4j-parent:pom:1.6.4
ARTIFACT_RESOLVED org.slf4j:slf4j-parent:pom:1.6.4 (/home/evenson/.m2/repository/org/slf4j/slf4j-parent/1.6.4/slf4j-parent-1.6.4.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.slf4j:slf4j-log4j12:pom:1.6.4
ARTIFACT_RESOLVED org.slf4j:slf4j-log4j12:pom:1.6.4 (/home/evenson/.m2/repository/org/slf4j/slf4j-log4j12/1.6.4/slf4j-log4j12-1.6.4.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.slf4j:slf4j-parent:pom:1.6.4
ARTIFACT_RESOLVED org.slf4j:slf4j-parent:pom:1.6.4 (/home/evenson/.m2/repository/org/slf4j/slf4j-parent/1.6.4/slf4j-parent-1.6.4.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING log4j:log4j:pom:1.2.16
ARTIFACT_RESOLVED log4j:log4j:pom:1.2.16 (/home/evenson/.m2/repository/log4j/log4j/1.2.16/log4j-1.2.16.pom) @ /home/evenson/.m2/repository (enhanced)
ARTIFACT_RESOLVING xerces:xercesImpl:pom:2.10.0
ARTIFACT_RESOLVED xerces:xercesImpl:pom:2.10.0 (/home/evenson/.m2/repository/xerces/xercesImpl/2.10.0/xercesImpl-2.10.0.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING xml-apis:xml-apis:pom:1.4.01
ARTIFACT_RESOLVED xml-apis:xml-apis:pom:1.4.01 (/home/evenson/.m2/repository/xml-apis/xml-apis/1.4.01/xml-apis-1.4.01.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING commons-codec:commons-codec:pom:1.5
ARTIFACT_RESOLVED commons-codec:commons-codec:pom:1.5 (/home/evenson/.m2/repository/commons-codec/commons-codec/1.5/commons-codec-1.5.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.commons:commons-parent:pom:20
ARTIFACT_RESOLVED org.apache.commons:commons-parent:pom:20 (/home/evenson/.m2/repository/org/apache/commons/commons-parent/20/commons-parent-20.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache:apache:pom:9
ARTIFACT_RESOLVED org.apache:apache:pom:9 (/home/evenson/.m2/repository/org/apache/apache/9/apache-9.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.httpcomponents:httpclient:pom:4.1.2
ARTIFACT_RESOLVED org.apache.httpcomponents:httpclient:pom:4.1.2 (/home/evenson/.m2/repository/org/apache/httpcomponents/httpclient/4.1.2/httpclient-4.1.2.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.httpcomponents:httpcomponents-client:pom:4.1.2
ARTIFACT_RESOLVED org.apache.httpcomponents:httpcomponents-client:pom:4.1.2 (/home/evenson/.m2/repository/org/apache/httpcomponents/httpcomponents-client/4.1.2/httpcomponents-client-4.1.2.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.httpcomponents:project:pom:4.1.1
ARTIFACT_RESOLVED org.apache.httpcomponents:project:pom:4.1.1 (/home/evenson/.m2/repository/org/apache/httpcomponents/project/4.1.1/project-4.1.1.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.httpcomponents:httpcore:pom:4.1.2
ARTIFACT_RESOLVED org.apache.httpcomponents:httpcore:pom:4.1.2 (/home/evenson/.m2/repository/org/apache/httpcomponents/httpcore/4.1.2/httpcore-4.1.2.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.httpcomponents:httpcomponents-core:pom:4.1.2
ARTIFACT_RESOLVED org.apache.httpcomponents:httpcomponents-core:pom:4.1.2 (/home/evenson/.m2/repository/org/apache/httpcomponents/httpcomponents-core/4.1.2/httpcomponents-core-4.1.2.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.httpcomponents:project:pom:4.1.1
ARTIFACT_RESOLVED org.apache.httpcomponents:project:pom:4.1.1 (/home/evenson/.m2/repository/org/apache/httpcomponents/project/4.1.1/project-4.1.1.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING commons-codec:commons-codec:pom:1.4
ARTIFACT_RESOLVED commons-codec:commons-codec:pom:1.4 (/home/evenson/.m2/repository/commons-codec/commons-codec/1.4/commons-codec-1.4.pom) @ /home/evenson/.m2/repository (enhanced)
ARTIFACT_RESOLVING org.apache.commons:commons-parent:pom:11
ARTIFACT_RESOLVED org.apache.commons:commons-parent:pom:11 (/home/evenson/.m2/repository/org/apache/commons/commons-parent/11/commons-parent-11.pom) @ /home/evenson/.m2/repository (enhanced)
ARTIFACT_RESOLVING org.slf4j:jcl-over-slf4j:pom:1.6.4
ARTIFACT_RESOLVED org.slf4j:jcl-over-slf4j:pom:1.6.4 (/home/evenson/.m2/repository/org/slf4j/jcl-over-slf4j/1.6.4/jcl-over-slf4j-1.6.4.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.slf4j:slf4j-parent:pom:1.6.4
ARTIFACT_RESOLVED org.slf4j:slf4j-parent:pom:1.6.4 (/home/evenson/.m2/repository/org/slf4j/slf4j-parent/1.6.4/slf4j-parent-1.6.4.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.httpcomponents:httpcore:pom:4.1.3
ARTIFACT_RESOLVED org.apache.httpcomponents:httpcore:pom:4.1.3 (/home/evenson/.m2/repository/org/apache/httpcomponents/httpcore/4.1.3/httpcore-4.1.3.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.httpcomponents:httpcomponents-core:pom:4.1.3
ARTIFACT_RESOLVED org.apache.httpcomponents:httpcomponents-core:pom:4.1.3 (/home/evenson/.m2/repository/org/apache/httpcomponents/httpcomponents-core/4.1.3/httpcomponents-core-4.1.3.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.httpcomponents:project:pom:4.1.1
ARTIFACT_RESOLVED org.apache.httpcomponents:project:pom:4.1.1 (/home/evenson/.m2/repository/org/apache/httpcomponents/project/4.1.1/project-4.1.1.pom) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.jena:jena-arq:jar:LATEST
METADATA_RESOLVING org.apache.jena:jena-arq/maven-metadata.xml @ /home/evenson/.m2/repository (enhanced)
METADATA_RESOLVED org.apache.jena:jena-arq/maven-metadata.xml @ /home/evenson/.m2/repository (enhanced)
METADATA_RESOLVING org.apache.jena:jena-arq/maven-metadata.xml @ central (http://repo1.maven.org/maven2/, releases+snapshots)
METADATA_RESOLVED org.apache.jena:jena-arq/maven-metadata.xml (/home/evenson/.m2/repository/org/apache/jena/jena-arq/maven-metadata-central.xml) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVED org.apache.jena:jena-arq:jar:2.9.4 (/home/evenson/.m2/repository/org/apache/jena/jena-arq/2.9.4/jena-arq-2.9.4.jar) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.jena:jena-core:jar:2.7.4
ARTIFACT_RESOLVED org.apache.jena:jena-core:jar:2.7.4 (/home/evenson/.m2/repository/org/apache/jena/jena-core/2.7.4/jena-core-2.7.4.jar) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.jena:jena-iri:jar:0.9.4
ARTIFACT_RESOLVED org.apache.jena:jena-iri:jar:0.9.4 (/home/evenson/.m2/repository/org/apache/jena/jena-iri/0.9.4/jena-iri-0.9.4.jar) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING xerces:xercesImpl:jar:2.10.0
ARTIFACT_RESOLVED xerces:xercesImpl:jar:2.10.0 (/home/evenson/.m2/repository/xerces/xercesImpl/2.10.0/xercesImpl-2.10.0.jar) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING xml-apis:xml-apis:jar:1.4.01
ARTIFACT_RESOLVED xml-apis:xml-apis:jar:1.4.01 (/home/evenson/.m2/repository/xml-apis/xml-apis/1.4.01/xml-apis-1.4.01.jar) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING commons-codec:commons-codec:jar:1.5
ARTIFACT_RESOLVED commons-codec:commons-codec:jar:1.5 (/home/evenson/.m2/repository/commons-codec/commons-codec/1.5/commons-codec-1.5.jar) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.httpcomponents:httpclient:jar:4.1.2
ARTIFACT_RESOLVED org.apache.httpcomponents:httpclient:jar:4.1.2 (/home/evenson/.m2/repository/org/apache/httpcomponents/httpclient/4.1.2/httpclient-4.1.2.jar) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.slf4j:jcl-over-slf4j:jar:1.6.4
ARTIFACT_RESOLVED org.slf4j:jcl-over-slf4j:jar:1.6.4 (/home/evenson/.m2/repository/org/slf4j/jcl-over-slf4j/1.6.4/jcl-over-slf4j-1.6.4.jar) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.apache.httpcomponents:httpcore:jar:4.1.3
ARTIFACT_RESOLVED org.apache.httpcomponents:httpcore:jar:4.1.3 (/home/evenson/.m2/repository/org/apache/httpcomponents/httpcore/4.1.3/httpcore-4.1.3.jar) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.slf4j:slf4j-api:jar:1.6.4
ARTIFACT_RESOLVED org.slf4j:slf4j-api:jar:1.6.4 (/home/evenson/.m2/repository/org/slf4j/slf4j-api/1.6.4/slf4j-api-1.6.4.jar) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING org.slf4j:slf4j-log4j12:jar:1.6.4
ARTIFACT_RESOLVED org.slf4j:slf4j-log4j12:jar:1.6.4 (/home/evenson/.m2/repository/org/slf4j/slf4j-log4j12/1.6.4/slf4j-log4j12-1.6.4.jar) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
ARTIFACT_RESOLVING log4j:log4j:jar:1.2.16
ARTIFACT_RESOLVED log4j:log4j:jar:1.2.16 (/home/evenson/.m2/repository/log4j/log4j/1.2.16/log4j-1.2.16.jar) @ central (http://repo1.maven.org/maven2/, releases+snapshots)
Test JEANNIE::JEANNIE.INDEX.1 failed
Form: (JEANNIE:INDEX)
Expected value: T
Actual value: "/home/evenson/.m2/repository/org/apache/jena/jena-arq/2.9.4/jena-arq-2.9.4.jar:/home/evenson/.m2/repository/org/apache/jena/jena-core/2.7.4/jena-core-2.7.4.jar:/home/evenson/.m2/repository/org/apache/jena/jena-iri/0.9.4/jena-iri-0.9.4.jar:/home/evenson/.m2/repository/xerces/xercesImpl/2.10.0/xercesImpl-2.10.0.jar:/home/evenson/.m2/repository/xml-apis/xml-apis/1.4.01/xml-apis-1.4.01.jar:/home/evenson/.m2/repository/commons-codec/commons-codec/1.5/commons-codec-1.5.jar:/home/evenson/.m2/repository/org/apache/httpcomponents/httpclient/4.1.2/httpclient-4.1.2.jar:/home/evenson/.m2/repository/org/slf4j/jcl-over-slf4j/1.6.4/jcl-over-slf4j-1.6.4.jar:/home/evenson/.m2/repository/org/apache/httpcomponents/httpcore/4.1.3/httpcore-4.1.3.jar:/home/evenson/.m2/repository/org/slf4j/slf4j-api/1.6.4/slf4j-api-1.6.4.jar:/home/evenson/.m2/repository/org/slf4j/slf4j-log4j12/1.6.4/slf4j-log4j12-1.6.4.jar:/home/evenson/.m2/repository/log4j/log4j/1.2.16/log4j-1.2.16.jar".

3 out of 3 total tests failed: JEANNIE::JEANNIE::JEANNIE.INDEX.1 JEANNIE::JEANNIE.READ-RDF.1 JEANNIE::JEANNIE.MODEL.1.


## TODO

Sketch out an API with CLOS:


First, decide on generic functions names intersection with type
system.  Then choose arguments carefully...

Possible methods (sought for qualities: short, as few as possible):

    JEANNIE:PARSE PATHNAME &optional MODEL
    
    JEANNIE:INFER PATHNAME &optional MODEL
    
    JEANNIE:AFFIRM  &optional PATHNAME MODEL
    
    JEANNIE:FREEZE PATHNAME &optional MODEL
    
N.b. Use single form of DEFGENERIC (no DEFMETHOD!)  Documentation.
    
    
## Colophon

Mark <evenson.not.org@gmail.com>

Created: 20-JAN-2012
Revised: 05-DEC-2013

