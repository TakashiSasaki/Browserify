# entry.mk

entryYes.ugly: main.js modules/hello.js modules/goodbye.js
	browserify --im -o $@ -e entryMain $^

entryNo.ugly: main.js modules/hello.js modules/goodbye.js
	browserify --im -o $@ $^

entry.diff: entryYes.bundled entryNo.bundled
	-diff -w -B -c $^ | tee $@

entry: entryNo.log entryYes.log entry.diff entryNo.chrome entryYes.chrome

