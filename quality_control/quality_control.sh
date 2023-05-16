#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:40:00
#SBATCH -J cristi_qc
#SBATCH -o out_slrum.out
#SBATCH -e err_slrum.err
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user cristian-catalin.pop.9828@student.uu.se

module load bioinfo-tools FastQC/0.11.9

source1=/home/cristp/GenomeAnalysis/results/trimmed/output_forward_paired.fastq.gz 
source2=/home/cristp/GenomeAnalysis/results/trimmed/output_reverse_paired.fastq.gz

fastqc $source1 $source2 -o /home/cristp/GenomeAnalysis/results/sequence_quality_trimmed


