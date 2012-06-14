Jeannie
=======

A wrapping of Jena in Common Lisp.

## Usage

1.  Add to ASDF
    
        cmd$ mkdir -p ~/.asdf-install-dir/systems/
        cmd$ ln -s jeannie.asd ~/.asdf-install-dir/systems/
        cmd$ abcl --noinit --noinform  
        CL-USER> (require 'abcl-contrib)
        CL-USER> (require 'abcl-asdf)
        CL-USER> (require 'jeannine)
        CL-USER> ...
    
2.  Show INDEX of available jars

        CL-USER> (jeannie:index)
        
3.  Read RDF

        CL-USER> (jeannie:read-rdf "~/work/jeannie/test/tests.n3")

## Colophon

Mark <evenson.not.org@gmail.com>

Created: 20-JAN-2012
Revised: 15-JAN-2012
