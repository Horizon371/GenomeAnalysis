#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:40:00
#SBATCH -J cristi_qc
#SBATCH -o out_slrum.out
#SBATCH -e err_slrum.err


module load bioinfo-tools trimmomatic/0.39

source=/proj/genomeanalysis2023/Genome_Analysis/1_Zhang_2017/genomics_data/Illumina/*
output=/home/cristp/GenomeAnalysis/results/trimmed

trimmomatic PE $source $output/output_forward_paired.fastq.gz $output/output_forward_unpaired.fastq.gz $output/output_reverse_paired.fastq.gz $output/output_reverse_unpaired.fastq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
