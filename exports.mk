# Makefile.exports

exportsYes.tmp: exportsMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ $^

exportsYes: exportsYes.js
	$(NODE) $<

exportsDiff: entryNo.js exportsYes.js
	-diff -w -B -c $^

exports: exportsYes exportsDiff


