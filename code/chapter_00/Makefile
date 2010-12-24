# 

url := https://docs.google.com/document/pub?id=1tvk2zbmcA_-x6GBnuhaKHBRhhcTATUh7YYVhx6qbkGc

doc:
	w3m -dump $(url) | perl -pe 's/^(\s+)1\./\1+/' > Notes.txt

.PHONY: doc
