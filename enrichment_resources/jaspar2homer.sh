#!/bin/sh

for arg in "$@"
do
	
	perl ../parseJasparMatrix.pl "$arg" > "${arg/.jaspar/.tmp.motif}"
		
	Rscript --vanilla ../PWM_Convert.R "${arg/.jaspar/.tmp.motif}" > "${arg/.jaspar/.score.txt}"
	
	score=$(head -n 1 "${arg/.jaspar/.score.txt}")
		
	head -n 1 "${arg/.jaspar/.tmp.motif}" | gsed "s/0$/$score/" > "${arg/.jaspar/.header.txt}"
	
	cat "${arg/.jaspar/.header.txt}" "${arg/.jaspar/.corrected.motif}" > "${arg/.jaspar/.final.motif}"
	
	rm "${arg/.jaspar/.header.txt}" \
	"${arg/.jaspar/.score.txt}" \
	"${arg/.jaspar/.tmp.motif}" \
	"${arg/.jaspar/.corrected.motif}"
	
done
