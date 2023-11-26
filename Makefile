.PHONY: idx
%.md: %.q
	qnote2.q $< >$@

qfile := $(wildcard *.q)
md := $(qfile:%.q=%.md)
all: $(md)

idx: 
	@echo \# Zettelkasten Notes about Kdb+/Q, Category Theory, and Relation Algebra > index.md
	@rg -m1 '' -g '*.md' | grep -v AWS_gr | grep -v index.md |awk 'BEGIN {FS = ":"} ; {print "- ["substr($$2,3)"]("$$1")" }' >> index.md
