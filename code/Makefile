all:
	for i in *; do if [ -d $$i ] && [ -f $$i/Makefile ]; then $(MAKE) -C $$i $(MAKE_TARGETS); fi; done
