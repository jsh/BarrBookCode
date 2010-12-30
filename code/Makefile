default: doc

clean doc::
	for i in *; do if [ -d $$i ] && [ -f $$i/Makefile ]; then $(MAKE) -C $$i $(MAKE_TARGETS) $@; fi; done

toc: doc
	for i in *; do if [ -f $$i/Makefile ]; then grep 'Chapter.*:' $$i/Notes.txt; grep 'url :=' $$i/Makefile; fi; done > TOC

	perl -i -ne 'chomp; if (/Chapter/) {print "$$_ -- ";} else { s/url\s:=//; print $$_; print "\n"; }' TOC

clean::
	git status -s &> /dev/null && { git status -s | awk '/^\?\?/{print "rm", $$2}' | bash; }

.PHONY: clean doc toc

