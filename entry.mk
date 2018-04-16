entryYes.ugly: entryMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ -e entryMain $^

entryNo.ugly: entryMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ $^

entryNo: entryNo.nodejs entryNo.bundled
	$(NODE) $<

entryYes: entryYes.nodejs entryYes.bundled
	$(NODE) $<

entryDiff: entryYes.bundled entryNo.bundled
	-diff -w -B -c $^

entry: entryYes entryNo entryYes entryNo

