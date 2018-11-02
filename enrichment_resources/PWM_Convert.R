#!/usr/bin/env Rscript

input <- commandArgs(trailingOnly=TRUE)

pwmMatrix <- read.table(as.character(input[1]), header = F, skip = 1)

pwmMatrix <- apply(pwmMatrix, 1, function(x) x/sum(x))

pwmMatrix <- t(pwmMatrix)

perfectScore <- apply(pwmMatrix,1, function(x) log(max(x)/0.25))

perfectScore <- sum(perfectScore)

perfectScore <- perfectScore * 0.4

write.table(pwmMatrix, file = paste0(gsub(".tmp.motif","",input), ".corrected.motif"), quote = F, sep = "\t", row.names = F, col.names = F)

cat(perfectScore)