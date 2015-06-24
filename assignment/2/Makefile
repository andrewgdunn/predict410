assignment: assignment2.md assignment2.bib Makefile
	pandoc assignment2.md \
	--output assignment2_Dunn.pdf \
	--smart \
	--bibliography=assignment2.bib \
	--csl=../../templates/ieee-with-url.csl \
	--template=../../templates/compact.latex \
	-V geometry:margin=1in

clean:
	rm assignment2.pdf