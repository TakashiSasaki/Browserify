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

standaloneYes.patch:
	-diff -w -B -c standaloneYes.beautiful standaloneYes.bundled | tee >$@

standaloneNo.patch:
	-diff -w -B -c standaloneNo.beautiful standaloneNo.bundled | tee >$@

standalone: standaloneNo standaloneYes standaloneDiff

