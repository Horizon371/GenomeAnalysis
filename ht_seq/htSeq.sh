#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 09:00:00
#SBATCH -J cristi_qc
#SBATCH -o job.out
#SBATCH -e job.err
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user cristian-catalin.pop.9828@student.uu.se

module load bioinfo-tools htseq/2.0.2

input=/home/cristp/GenomeAnalysis/results/mapping/*
annotation="/home/cristp/GenomeAnalysis/results/annotation/PROKKA_04262023_WO_FASTA.gff"
output="/home/cristp/GenomeAnalysis/results/ht_seq"

for alignment_file in $input
do
    name="$(basename "${alignment_file%.*}")"
    htseq-count -r pos -f bam -i locus_tag -t CDS $alignment_file $annotation > $output/$name.txt
done
