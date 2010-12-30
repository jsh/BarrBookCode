# 

SHELL := /bin/bash
url   := https://docs.google.com/document/pub?id=1lCZJcdeg8vZR8Yh4pD1WkO80i4j5qPra3inxn1nCboM

doc:
	w3m -dump $(url) | perl -pe 's/^(\s+)1\./\1+/' > Notes.txt

clean:

.PHONY: clean doc
