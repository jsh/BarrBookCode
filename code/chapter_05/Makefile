# 

url := https://docs.google.com/document/pub?id=1fLCa0BnQBCcFb3SjvvSVo7Vs9SDEDlQrzUqBl2-dqzM

doc:
	w3m -dump $(url) | perl -pe 's/^(\s+)1\./\1+/' > Notes.txt
