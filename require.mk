requireYes.tmp: requireMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ $< -r ./modules/hello.js -r ./modules/goodbye.js

requireNo.tmp: requireMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ $<

requireNo: requireNo.js
	$(NODE) $<

requireYes: requireYes.js
	$(NODE) $<

requireNoTest: requireNoTest.js requireNo.js
	$(NODE) $<

requireYesTest: requireYesTest.js requireYes.js
	$(NODE) $<

requireDiff: requireNo.js requireYes.js
	-diff -w -B -c $^

require: requireNo requireYes requireNoTest requireYesTest requireDiff

