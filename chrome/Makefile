.PHONY: all
.SUFFIXES:
.SUFFIXES: .bundled .log .js
	
vpath %.bundled ../bundled

all: entry.diff standalone.diff target.diff require.diff

clean: 
	-rm -rf *lighthouse* *.log

.bundled.log: 
	runinchrome $< ../node/node.js >$@

entry.diff: entryNo.log entryYes.log
	-diff -w -B -c $^ >$@

standalone.diff: standaloneNo.log standaloneYes.log
	-diff -w -B -c $^ >$@

target.diff: targetNo.log targetYes.log
	-diff -w -B -c $^ >$@

require.diff: requireNo.log requireYes.log
	-diff -w -B -c $^ >$@

