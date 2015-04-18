assignment: assignment3.md assignment3.bib Makefile
	pandoc assignment3.md \
	--output assignment3_Dunn.pdf \
	--smart \
	--bibliography=assignment3.bib \
	--csl=../../templates/ieee-with-url.csl \
	--template=../../templates/compact.latex \
	-V geometry:margin=1in

clean:
	rm assignment3.pdf