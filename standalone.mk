# standalone.mk

standaloneNo.ugly: standaloneMain.js modules/hello.js modules/goodbye.js
	browserify -o $@ $^ 

standaloneYes.ugly: standaloneMain.js modules/hello.js modules/goodbye.js
	browserify -s hoge -o $@ $^ 

standaloneNo: standaloneNo.nodejs standaloneNo.bundled
	$(NODE) $<

standaloneYes: standaloneYes.nodejs standaloneYes.bundled
	$(NODE) $<

standaloneDiff: standaloneNo.bundled standaloneYes.bundled
	-diff -w -B -c $^

standaloneYes.patch: standaloneYes.beautiful standaloneYes.bundled
	-diff -c $^

standaloneNo.patch: standaloneNo.beautiful standaloneYes.bundled
	-diff -c $^

standalone: standaloneNo standaloneYes standaloneDiff

