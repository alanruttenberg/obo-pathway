(defparameter *opath-spreadsheets*
  '(("TLR9.xlsx" "TLR9 nfKb signaling" 800)
    ;("TLR7.xlsx" "TLR7 IRF5 signalin" 1000)
    ("TLR8.xlsx" "TLR8 IRF5 signaling" 1200)
    ;("NOD2.07.05.10.xlsx" "NOD2 signaling" 1400)
    ;--NOT YET --("tnf signaling.xlsx" "TNF signaling" 1600)
    ;("ido-s4lps-tlr4.xlsx" "LPS recognition and signaling via TLR4" 200)
    ;("ido-tlr2lta.xlsx" "TLR2 Lta signaling" 400)
    ;("TLR3.xlsx" "dsRNA recognition and signaling via TLR3" 600)
    ))

(defun process-spreadsheets ()
  (loop for (sheet name startid) in *opath-spreadsheets*
       for book = (make-instance 'opath-pathway-book
				 :book-path (merge-pathnames sheet "opath:immunology;")
				 :pathway-name name)
     do
       (setq *immunology-uri-id-counter* startid)
       (print book)
       (setf (uri-index book) startid)
       (parse-book book)
       (write-external.owl Book)
       (write-pathway.owl Book)
       (write-external-derived.owl book)
       collect book))

(defun check-complex-handles (books)
  (loop for book in books do (print-db book)
       (loop for block in (blocks-of-type book 'parsed-complex-block)
	  do (loop for row in (parsed-rows block) do (format t "~a - ~a:~a ~{~a:~a~^ ~}~%"
							     row
							     (handle row) (if (lookup-handle (in-sheet block) (handle row)) "<ok>" "<nohandle>")
							     (loop for h in (complex-elements row) collect h 
								collect (if (lookup-handle (in-sheet block) h) "<ok>" "<nohandle>")))))))


;(create-external-derived :kb (load-ontology "/Users/alanr/repos/infectious-disease-ontology/trunk/src/ontology/immunology/proto/TLR2-Lta-signaling-pathway-external.owl") :output-path "/Users/alanr/repos/infectious-disease-ontology/trunk/src/ontology/immunology/proto/TLR2-Lta-signaling-pathway-external-derived.owl")

