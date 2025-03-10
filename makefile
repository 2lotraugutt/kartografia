all: doc.pdf


doc.pdf: $(wildcard *.tsv)
%.pdf: %.ms
	 < $< soelim | groff -s -k -ms -t -Tpdf  > $@
