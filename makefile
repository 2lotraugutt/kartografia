all: doc.pdf mapa.dot.pdf


doc.pdf: $(wildcard *.tsv)

%.pdf: %.ms
	 < $< soelim | groff -s -k -ms -t -Tpdf  > $@

mapa.dot:
	python graphviz_generate.py > mapa.dot

%.dot.pdf: %.dot
	 dot $< -Tpdf > $@
