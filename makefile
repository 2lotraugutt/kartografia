all: mapa.pdf


mapa.pdf: $(wildcard *.tsv)
%.pdf: %.ms
	 < $< soelim | groff -s -k -ms -t -Tpdf  > $@
