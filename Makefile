study: study.md study.bib Makefile
	pandoc study.md \
	--output study.pdf \
	--smart \
	--bibliography=study.bib \
	--csl=templates/acm-siggraph.csl \
	--template=templates/compact.latex \
	-V geometry:margin=0.7in,nohead,nofoot

clean:
	rm study.pdf