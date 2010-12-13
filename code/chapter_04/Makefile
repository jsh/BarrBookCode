# 

url := https://docs.google.com/document/pub?id=1iBYue01CDkkzv3l6LpAPui5J1ME14RtErMrFh_fAPDs

doc:
	w3m -dump $(url) | perl -pe 's/^(\s+)1\./\1+/' > Notes.txt
