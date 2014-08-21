tesis-postgrado.pdf:tesis-postgrado.tex
		    pdflatex tesis-postgrado.tex
		    bibtex tesis-postgrado
		    pdflatex tesis-postgrado.tex
		    bibtex tesis-postgrado
		    pdflatex tesis-postgrado.tex
clean:
	rm -f tesis-postgrado.pdf
