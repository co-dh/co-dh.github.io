%.md: %.q
	qnote.q $< >$@
all: partition.md matrix_multiplication.md
