# 

url := https://docs.google.com/document/pub?id=18U2ZMMEK-M541LvOCxh8yUR-1tJvw-H3JV3E-OGjpW0

doc:
	w3m -dump $(url) | perl -pe 's/^(\s+)1\./\1+/' > Notes.txt

clean:
	rm -rf Results
