PROJECTS := /Users/fgu/dev/personal
THESIS := $(PROJECTS)/warwickthesis
MLBT := $(PROJECTS)/mlbt
ENTROPY := $(PROJECTS)/entropy
EVAL := $(PROJECTS)/mdb_eval


.PHONY: thesis
thesis: clean_dirs gather_inputs compile_pdf view_pdf

.PHONY: clean_dirs
clean_dirs:
	rm -rf figures/*
	rm -rf tables/*

.PHONY: gather_inputs
gather_inputs:
	cp -R $(MLBT)/output/figures/* $(THESIS)/figures/
	cp -R $(MLBT)/output/tables/* $(THESIS)/tables/
	cp -R $(ENTROPY)/output/figures/* $(THESIS)/figures/
	cp -R $(ENTROPY)/output/tables/* $(THESIS)/tables/
	cp -R $(EVAL)/output/figures/* $(THESIS)/figures/
	cp -R $(EVAL)/output/tables/* $(THESIS)/tables/

.PHONY: compile_pdf
compile_pdf:
	latexmk -pdf thesis.tex
	-rm -f *.bcf *.aux *.log *.toc *.lof *.lot *.out *.nav *.snm *.vrb *.dvi *.bbl *.blg *.brf *.idx *.ilg *.ind *.synctex.gz *.fls *.fdb_latexmk *.run.xml

.PHONY: view_pdf
view_pdf:
	open -a Skim.app thesis.pdf

.PHONY: update_inputs
update_inputs: clean_dirs gather_inputs
