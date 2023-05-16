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

module load bioinfo-tools prokka/1.45-5b58020

source_canu=/home/cristp/GenomeAnalysis/results/assembled/canu/assembled_canu.contigs.fasta
reference=/home/cristp/GenomeAnalysis/other_input/GCF_009734005.1_ASM973400v2_genomic.fna
output=/home/cristp/GenomeAnalysis/results/blast/blast.out

prokka $source_canu
