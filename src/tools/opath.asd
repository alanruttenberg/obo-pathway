;;;; -*- Mode: LISP -*-
;;;;

(in-package :asdf)


(setf (logical-pathname-translations "opath")
      `(
	("immunology;**;*.*" ,(make-pathname :directory (append (butlast (pathname-directory *load-pathname*) 2)
						       '("src" "ontology" "immunology" :wild-inferiors))
				    :name :wild
				    :type :wild))
	("tools;**;*.*" ,(make-pathname :directory (append (pathname-directory *load-pathname*)
						       '(:wild-inferiors))
				    :name :wild
				    :type :wild
				    ))
	("lib;**;*.*" ,(make-pathname :directory (append (butlast (pathname-directory *load-pathname*) 2)
						       '("lib" :wild-inferiors))
				    :name :wild
				    :type :wild))
	))

(defsystem :opath
    :name "OBO Pathways"
    :license "BSD"
    :components
    ((:file "parse-pathway-spreadsheet")
     (:file "pathway-to-owl")
     (:file "process-spreadsheets")
     (:module "obi"
	:components
	((:file "create-external-derived")))
     )
    :depends-on (owl2 read-ms-docs)
    :serial t)

;;;; eof
