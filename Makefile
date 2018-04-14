.PHONY: prepare push pull clean all 
.SUFFIXES: .patched .tmp .js .beautified
.INTERMEDIATE: entryYes.tmp entryNo.tmp

NODE=NODE_PATH=$(NODE_PATH):. node

all: entry test-standalone test-require

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

entryYes.tmp: entryMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ -e entryMain $^

entryNo.tmp : entryMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ $^

entryYes: entryYes.js
	$(NODE) $<

entryNo: entryNo.js
	$(NODE) $<

entryYesTest: entryYesTest.js entryYes.js
	$(NODE) $<

entryNoTest: entryNoTest.js entryNo.js
	$(NODE) $<

entry: entryYes entryNo entryYesTest entryNoTest

entryDiff: entryYes.js entryNo.js
	diff -w -B -c $^

requireYes.tmp: requireMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ $< -r ./modules/hello.js -r ./modules/goodbye.js

requireNo.tmp: requireMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ $<

targetYes.tmp: requireMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ $< -r ./modules/hello.js:helloTarget -r ./modules/goodbye.js:goodbyeTarget

requireYes: requireYes.js
	$(NODE) $<

requireNo: requireNo.js
	$(NODE) $<

requireYesTest: requireYesTest.js requireYes.js
	$(NODE) $<

requireNoTest: requireNoTest.js requireNo.js
	$(NODE) $<

test-require: requireYesTest requireNoTest

diff-require: requireYes.js requireNo.js
	diff -w -B $^

targetYesTest: targetYesTest.js targetYes.js
	$(NODE) $<

test-target: targetYesTest

diff-target: targetYes.js requireYes.js
	diff -w -B $^

standaloneNo.tmp: hello.js goodbye.js standaloneMain.js
	browserify -o $@ $^ 

standaloneYes.tmp: hello.js goodbye.js standaloneMain.js
	browserify -s standaloneYes -o $@ $^ 

standaloneNoTest: standaloneNoTest.js standaloneNo.js
	$(NODE) $<

standaloneYesTest: standaloneYesTest.js standaloneYes.js
	$(NODE) $<

test-standalone: standaloneYesTest standaloneNoTest

diff-standalone: standaloneYes.js standaloneNo.js
	diff -w $^

