# 

url := https://docs.google.com/document/pub?id=1uVtPIPaxkfBbmx2NGlHMmiQm7_Tf1R5ZPA_0SzW4B_w

doc:
	w3m -dump $(url) | perl -pe 's/^(\s+)1\./\1+/' > Notes.txt
