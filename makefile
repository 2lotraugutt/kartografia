all: doc.pdf mapa.dot.pdf

clean:
	rm -f doc.pdf mapa.dot.pdf mapa.dot
	

doc.pdf: $(wildcard *.tsv)

%.pdf: %.ms
	 < $< soelim | groff -s -k -ms -t -Tpdf  > $@

mapa.dot: mapa.tsv
	python graphviz_generate.py > mapa.dot

%.dot.pdf: %.dot
	 dot $< -Tpdf > $@
