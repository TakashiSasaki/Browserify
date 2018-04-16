targetYes.ugly: targetMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ $< -r ./modules/hello.js:helloTarget -r ./modules/goodbye.js:goodbyeTarget

targetYes: targetYes.nodejs targetYes.bundled
	$(NODE) $<

targetDiff: requireYes.bundled targetYes.bundled
	-diff -w -B -c $^

target: requireYes targetYes targetYes targetDiff

