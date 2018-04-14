.PHONY: prepare push pull clean all 
.SUFFIXES: .patched .ugly .js .beautiful
.INTERMEDIATE: entryYes.tmp entryNo.tmp

NODE=NODE_PATH=$(NODE_PATH):. node

all: entry exports require target standalone

push: $(BROWSERIFIED)
	clasp push

pull:
	clasp pull

clean:
	@rm -rf entryYes.js entryNo.js standaloneYes.js standaloneNo.js requireYes.js requireNo.js *.ugly *.beautiful *.patched

prepare:
	sudo n stable ;\
		sudo npm -g update ;\
		sudo npm -g install browserify js-beautify js-prettify @google/clasp

.ugly.beautiful:
	js-beautify -f $< -o $@

.beautiful.patched:
	patch -o $@ $< $*.patch

.patched.js:
	js-beautify -f $< -o $@

include entry.mk
include exports.mk
include require.mk
include target.mk
include standalone.mk

