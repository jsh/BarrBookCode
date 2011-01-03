# include this with
# include ../../make-modules/bbc.mk

SHELL     := /bin/bash

## cleanliness is next to godliness
cleanfiles := Notes.{html,txt}

clean:
	rm -rf $(cleanfiles)

distclean:
	git -d -x clean

## make local html and text copies of documentation from Google Docs

doc:
	curl $(docurl) > Notes.html 2>/dev/null
	w3m -dump Notes.html | perl -pe 's/^(\s+)1\./\1+/' > Notes.txt


## set up for linting

phpfiles  := $(wildcard *.php */*.php)
lint_tgts := $(phpfiles:.php=.lint)

%.lint:%.php
	php -l $<

lint: $(lint_tgts)

.PHONY: clean distclean doc lint

