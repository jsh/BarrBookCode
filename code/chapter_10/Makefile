# 

url := https://docs.google.com/document/pub?id=1Wfi7xppjME96UWDyIXrkxFtml3CFFeaAdmrdvjS5fXE

doc:
	w3m -dump $(url) | perl -pe 's/^(\s+)1\./\1+/' > Notes.txt

.PHONY: doc
