.PHONY: all build clean

all: plots build clean

plots:
	./plot.sh

build:
	pdflatex gr.tex
	pdflatex gr.tex
	pdflatex gr.tex

clean:
	rm -f *.aux
	rm -f *.lof
	rm -f *.log
	rm -f *.lol
	rm -f *.lot
	rm -f *.out
	rm -f *.toc
