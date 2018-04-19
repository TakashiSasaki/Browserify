# entry.mk

entryYes.ugly: main.js modules/hello.js modules/goodbye.js mkdir
	browserify --im -o tmp/$@ -e entryMain $^

entryNo.ugly: main.js modules/hello.js modules/goodbye.js mkdir
	browserify --im -o tmp/$@ $^

entry.diff: entryYes.bundled entryNo.bundled
	-cd bundled; diff -w -B -c $^ >$@

entry: entryNo.log entryYes.log entry.diff entryNo.chrome entryYes.chrome

