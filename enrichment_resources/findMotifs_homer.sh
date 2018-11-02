#!/bin/sh
for arg in "$@"
do
	findMotifsGenome.pl "$arg" \
	../resources/Hm105_Dovetail_Assembly_1.0.fasta \
	"${arg/.bed/}" \
	-size given -p 6 -mknown ../resources/Hydra_PFMs/Hydra.motifs \
	-mcheck ../resources/Hydra_PFMs/Hydra.motifs
done