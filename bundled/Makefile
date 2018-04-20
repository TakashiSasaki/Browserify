.PHONY: clean all

all: entry.diff standalone.diff require.diff target.diff

clean:
	-rm -rf *.bundled *.diff

entry.diff: entryYes.bundled entryNo.bundled
	-diff -w -B -c $^ >$@

standalone.diff : standaloneNo.bundled standaloneYes.bundled
	-diff -w -B -c $^ >$@

require.diff: requireNo.bundled requireYes.bundled 
	-diff -w -B -c $^ >$@

target.diff: requireYes.bundled targetYes.bundled 
	-diff -w -B -c $^ >$@


