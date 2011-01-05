# use bash to interpret all rules
SHELL := /bin/bash

# lists of files
allfiles :=  $(wildcard *.sh *.pl)
no-check := gripe.sh
allfiles := $(filter-out $(no-check),$(allfiles))
basenames := $(basename $(allfiles))
syntaxfiles := $(addsuffix .syntax, $(basenames))

# syntax check a shell script
%.syntax: %.sh
	bash -n $< &> $@
	rm $@

# syntax check a Perl script
%.syntax: %.pl
	perl -c -Mstrict $< &> $@
	perlcritic $< &>> $@
	rm $@

test-syntax: $(syntaxfiles)

# remove all scratch files
cleanfiles := *.syntax
clean:
	rm -f $(cleanfiles)

.PRECIOUS: *.syntax
.PHONY: clean test-syntax
