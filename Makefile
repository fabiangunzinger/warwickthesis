
PROJECTS := /Users/fgu/dev/projects
SECTIONS := /text/paper/sections
THESIS := $(PROJECTS)/warwickthesis
MLBT := $(PROJECTS)/mlbt
ENTROPY := $(PROJECTS)/entropy
EVAL := $(PROJECTS)/mdb_eval


.PHONY: thesis
thesis: clean_inputs gather_inputs pdf view


.PHONY: clean_inputs
clean_inputs:
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


.PHONY: pdf
pdf:
	pdflatex thesis.tex -o thesis.pdf


.PHONY: view
view:
	open thesis.pdf
