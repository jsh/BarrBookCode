# 

url := https://docs.google.com/document/pub?id=1Vzep_dsDIg-2LkqKbZk0yb2SFVFzw-e9sqMOqxjCfiQ

doc:
	w3m -dump $(url) | perl -pe 's/^(\s+)1\./\1+/' > Notes.txt
