# 

SHELL := /bin/bash
url   := https://docs.google.com/document/pub?id=1rULJHuOYXS8BZPVhr0JIebuq4FdXfRUnihnEvDcJzh8

doc:
	w3m -dump $(url) | perl -pe 's/^(\s+)1\./\1+/' > Notes.txt

clean:

.PHONY: clean doc
