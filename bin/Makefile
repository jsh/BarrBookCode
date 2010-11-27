SHELL := /bin/bash

allfiles :=  $(wildcard *.sh *.pl)
basenames := $(basename $(allfiles))
syntaxfiles := $(addsuffix .syntax, $(basenames))

%.syntax: %.sh
	bash -n $< &> $@
	rm $@

%.syntax: %.pl
	perl -c -Mstrict $< &> $@
	perlcritic $< &>> $@
	rm $@

test-syntax: $(syntaxfiles)

clean:
	rm -f *.syntax

.PRECIOUS: *.syntax
.PHONY: clean test-syntax
