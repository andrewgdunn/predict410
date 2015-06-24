assignment: assignment1.md assignment1.bib Makefile
	pandoc assignment1.md \
	--output Assignment1_Dunn.pdf \
	--smart \
	--bibliography=assignment1.bib \
	--csl=../../templates/ieee-with-url.csl \
	--template=../../templates/compact.latex \
	-V geometry:margin=1in

clean:
	rm assignment1.pdf