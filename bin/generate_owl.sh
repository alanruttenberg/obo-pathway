#!/bin/bash
# process spreadsheet(s)
export ABCL_BITS=64
~/src/owl/lsw2/bin/lsw <<'LSW_END'
(#"setProperty" 'system "http.proxyHost" "proxy.swmed.edu")
(#"setProperty" 'system "http.proxyPort" "3128")
(load "~/src/owl/obo-pathway/src/tools/opath.asd")
(asdf::oos 'asdf::load-op 'opath)
(setq *opath-spreadsheets* '(("ido-s4lps-tlr4.xlsx" "LPS recognition and signaling via TLR4" 200)))
(process-spreadsheets)
(setq *opath-spreadsheets* '(("ido-tlr2lta.xlsx" "TLR2 Lta signaling" 400)))
(process-spreadsheets)
(setq *opath-spreadsheets* '(("TLR3.xlsx" "dsRNA recognition and signaling via TLR3" 600)))
(process-spreadsheets)
(setq *opath-spreadsheets* '(("TLR9.xlsx" "TLR9 nfKb signaling" 800)))
(process-spreadsheets)
(setq *opath-spreadsheets* '(("TLR7.xlsx" "TLR7 IRF5 signalin" 1000)))
(process-spreadsheets)
(setq *opath-spreadsheets* '(("TLR8.xlsx" "TLR8 IRF5 signaling" 1200)))
(process-spreadsheets)
(setq *opath-spreadsheets* '(("NOD2.07.05.10.xlsx" "NOD2 signaling" 1400)))
(process-spreadsheets)
(quit)
LSW_END

