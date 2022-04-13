%.md: %.q
	qnote.q $< >$@

qfile := $(wildcard *.q)
md := $(qfile:%.q=%.md)
all: $(md)

idx:
	@echo \# Notes > index.md
	@rg -m1 '' -g '*.md' | grep -v AWS_gr | grep -v index.md |awk 'BEGIN {FS = ":"} ; {print "- ["substr($$2,3)"]("$$1")" }' >> index.md
