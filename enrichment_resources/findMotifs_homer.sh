#!/bin/sh
for arg in "$@"
do
	findMotifsGenome.pl "$arg" \
	../enrichment_resources/Hm105_Dovetail_Assembly_1.0.fasta \
	"${arg/.bed/}" \
	-size given -p 6 -mknown ../enrichment_resources/Hydra_PFMs/Hydra.motifs \
	-nomotif \
	-mcheck ../enrichment_resources/Hydra_PFMs/Hydra.motifs
done