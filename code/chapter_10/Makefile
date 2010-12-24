# 

url := https://docs.google.com/document/pub?id=1Vzep_dsDIg-2LkqKbZk0yb2SFVFzw-e9sqMOqxjCfiQ
url := xxxxx

doc:
	w3m -dump $(url) | perl -pe 's/^(\s+)1\./\1+/' > Notes.txt

.PHONY: doc
