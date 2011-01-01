# include this with
# include ../../make-modules/bbc.mk

SHELL := /bin/bash

cleanfiles := Notes.{html,txt}

clean:
	rm -rf $(cleanfiles)

doc:
	curl $(docurl) > Notes.html 2>/dev/null
	w3m -dump Notes.html | perl -pe 's/^(\s+)1\./\1+/' > Notes.txt

.PHONY: clean doc

