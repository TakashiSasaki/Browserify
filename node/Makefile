.PHONY: all log diff
	
.SUFFIXES: .bundled .log

vpath %.bundled ../bundled

all: log diff

log: entryNo.log entryYes.log standaloneNo.log standaloneYes.log \
	targetNo.log targetYes.log requireNo.log requireYes.log

diff: entry.diff standalone.diff require.diff target.diff

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


