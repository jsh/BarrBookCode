SHELL := /bin/bash

allfiles :=  $(wildcard *.sh *.pl)
no-check := gripe.sh
allfiles := $(filter-out $(no-check),$(allfiles))
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
