.PHONY: test prepare browserified push pull clean all test-entry diff-entry
NODE=NODE_PATH=$(NODE_PATH):. node

all: test-standalone test-require test-entry

push: $(BROWSERIFIED)
	clasp push

pull:
	clasp pull

clean:
	@rm -rf entryYes.js entryNo.js standaloneYes.js standaloneNo.js requireYes.js requireNo.js tmp.js *.tmp

prepare:
	sudo n stable ;\
		sudo npm -g update ;\
		sudo npm -g install browserify js-beautify js-prettify @google/clasp

%.js: %.tmp
	@js-beautify -f $< -o $@

entryYes.tmp: hello.js goodbye.js entryMain.js
	browserify -e entryMain -o $@ $^

entryNo.tmp : hello.js goodbye.js entryMain.js
	browserify -o $@ $^ 

entryYesTest: entryYesTest.js entryYes.js
	$(NODE) $<

entryNoTest: entryNoTest.js entryNo.js
	$(NODE) $<

test-entry: entryYesTest entryNoTest

diff-entry: entryYes.js entryNo.js
	diff -w $^

requireYes.tmp: requireMain.js hello.js goodbye.js
	browserify -o $@ $< -r ./hello.js -r ./goodbye.js

requireNo.tmp: requireMain.js hello.js goodbye.js
	browserify -o $@ $<

targetYes.tmp: requireMain.js hello.js goodbye.js
	browserify -o $@ $< -r ./hello.js:helloTarget -r ./goodbye.js:goodbyeTarget

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

