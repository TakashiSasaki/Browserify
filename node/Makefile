.PHONY: log diff
	
.SUFFIXES: .bundled .log

vpath %.bundled ../bundled

diff: log entry.diff standalone.diff require.diff target.diff

log: entryNo.log entryYes.log standaloneNo.log standaloneYes.log \
	requireNo.log requireYes.log requireDummy.log requireHello.log requireTarget.log \
	targetNo.log targetYes.log \

clean:
	-rm -rf *.log

.bundled.log: 
	NODE_PATH=/usr/local/lib/node_modules:../bundled node node.js $< >$@

entry.diff: entryNo.log entryYes.log
	-diff -w -B -c $^ >$@

requireYes.diff: requireNo.log requireYes.log
	-diff -w -B -c $^ >$@

requireDummy.diff: requireNo.log requireDummy.log
	-diff -w -B -c $^ >$@

requireHello.diff: requireNo.log requireHello.log
	-diff -w -B -c $^ >$@

requireTarget.diff: requireNo.log requireTarget.log
	-diff -w -B -c $^ >$@

standalone.diff: standaloneNo.log standaloneYes.log
	-diff -w -B -c $^ >$@

target.diff: targetNo.log targetYes.log
	-diff -w -B -c $^ >$@


