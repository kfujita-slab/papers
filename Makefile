FILE_NAME = main
TEX_FILE = ${FILE_NAME}.tex
PDF_FILE = ${FILE_NAME}.pdf

.PHONY: view clean abst

all: clean ${PDF_FILE}

view: ${PDF_FILE}
	evince ${PDF_FILE} &

${PDF_FILE}: 
	platex ${FILE_NAME}
	pbibtex ${FILE_NAME}
	platex ${FILE_NAME}
	ptex2pdf -l ${FILE_NAME}
	rm -f ${FILE_NAME}.lot ${FILE_NAME}.toc ${FILE_NAME}.lof \
		${FILE_NAME}.log ${FILE_NAME}.blg ${FILE_NAME}.bbl \
		${FILE_NAME}.aux abst.ps
clean:
	rm -f *~ *.aux *.log *.toc *.pdf *.dvi *.bbl *.lof *.lot *.blg
