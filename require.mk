requireYes.ugly: requireMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ $< -r ./modules/hello.js -r ./modules/goodbye.js

requireNo.ugly: requireMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ $<

requireNo: requireNo.nodejs requireNo.bundled
	$(NODE) $<

requireYes: requireYes.nodejs requireYes.bundled
	$(NODE) $<

requireDiff: requireNo.bundled requireYes.bundled
	-diff -w -B -c $^

require: requireNo requireYes requireDiff

