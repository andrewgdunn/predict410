assignment: assignment1.md assignment1.bib Makefile
	pandoc assignment1.md \
	--output assignment1.pdf \
	--smart \
	--bibliography=assignment1.bib \
	--csl=../..//templates/acm-siggraph.csl \
	--template=../..//templates/compact.latex \
	-V geometry:margin=0.7in,nohead,nofoot

clean:
	rm assignment1.pdf