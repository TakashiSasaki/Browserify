.PHONY: prepare push pull clean all 
.SUFFIXES: .patched .tmp .js .beautified
.INTERMEDIATE: entryYes.tmp entryNo.tmp

NODE=NODE_PATH=$(NODE_PATH):. node

all: entry require target standalone

push: $(BROWSERIFIED)
	clasp push

pull:
	clasp pull

clean:
	@rm -rf entryYes.js entryNo.js standaloneYes.js standaloneNo.js requireYes.js requireNo.js tmp.js *.tmp *.beautified *.patched

prepare:
	sudo n stable ;\
		sudo npm -g update ;\
		sudo npm -g install browserify js-beautify js-prettify @google/clasp

.tmp.beautified:
	js-beautify -f $< -o $@

.beautified.patched:
	patch -o $@ $< $*.patch

.patched.js:
	js-beautify -f $< -o $@

include Makefile-entry
include Makefile.exports
include Makefile-require
include Makefile-target
include Makefile-standalone

