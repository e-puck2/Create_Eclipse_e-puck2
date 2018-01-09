deps=$(wildcard fig/*) Makefile
sources=$(wildcard *.tex)
targets=$(sources:.tex=.pdf)

all:
	@for file in ${targets}; do $(MAKE) -s $$file; $(MAKE) -s clean; done

%.pdf:%.tex ${deps}
	echo "Rebuilding $@"
	pdflatex $<
	pdflatex $<

clean:
	@rm -f $(target) *.aux *.log *.blg *.bbl *.out *~ *.toc
