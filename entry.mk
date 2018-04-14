entryYes.ugly: entryMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ -e entryMain $^

entryNo.ugly: entryMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ $^

entryYes: entryYes.js
	$(NODE) $<

entryNo: entryNo.js
	$(NODE) $<

entryYesTest: entryYesTest.js entryYes.js
	$(NODE) $<

entryNoTest: entryNoTest.js entryNo.js
	$(NODE) $<

entryDiff: entryYes.js entryNo.js
	-diff -w -B -c $^

entry: entryYes entryNo entryYesTest entryNoTest

