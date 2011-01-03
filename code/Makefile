default: doc

clean distclean doc lint:
	for i in *; do if [ -d $$i ] && [ -f $$i/Makefile ]; then $(MAKE) -C $$i $(MAKE_TARGETS) $@; fi; done

toc: doc
	for i in *; do if [ -f $$i/Makefile ]; then grep 'Chapter.*:' $$i/Notes.txt; grep 'url :=' $$i/Makefile; fi; done > TOC

	perl -i -ne 'chomp; if (/Chapter/) {print "$$_ -- ";} else { s/url\s:=//; print $$_; print "\n"; }' TOC

.PHONY: clean distclean doc lint toc

