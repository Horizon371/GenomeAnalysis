#!/bin/sh
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 09:00:00
#SBATCH -J cristi_qc
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user cristian-catalin.pop.9828@student.uu.se

module load bioinfo-tools spades/3.15.5

source_short_fwd=/home/cristp/GenomeAnalysis/1_Zhang_2017/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz
source_short_bwd=/home/cristp/GenomeAnalysis/1_Zhang_2017/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz
source_long=/home/cristp/GenomeAnalysis/1_Zhang_2017/genomics_data/Nanopore
output=/home/cristp/GenomeAnalysis/results/assembled/spades

spades.py -k 21 --nanopore $source_long/* -1 $source_short_fwd -2 $source_short_bwd -o $output
