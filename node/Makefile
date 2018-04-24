.PHONY: all
	
.SUFFIXES: .bundled .log

vpath %.bundled ../bundled

all: entry.diff require.diff target.diff standalone.diff

clean:
	-rm -rf *.log

.bundled.log: 
	NODE_PATH=/usr/local/lib/node_modules:../bundled node node.js $< >$@

entry.diff: entryNo.log entryYes.log
	-diff -w -B -c $^ >$@

standalone.diff: standaloneNo.log standaloneYes.log
	-diff -w -B -c $^ >$@

target.diff: targetNo.log targetYes.log
	-diff -w -B -c $^ >$@

require.diff: requireNo.log requireYes.log
	-diff -w -B -c $^ >$@

