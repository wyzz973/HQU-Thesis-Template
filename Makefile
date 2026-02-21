# Makefile for HQU Thesis

MAIN = main
LATEX = xelatex
BIBTEX = bibtex

.PHONY: all clean

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex hquThesis.cls refs.bib chapters/*.tex
	$(LATEX) $(MAIN)
	$(BIBTEX) $(MAIN)
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz *.run.xml *.bcf chapters/*.aux

distclean: clean
	rm -f $(MAIN).pdf
