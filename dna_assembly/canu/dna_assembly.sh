#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 09:00:00
#SBATCH -J cristi_qc
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user cristian-catalin.pop.9828@student.uu.se

module load bioinfo-tools canu/2.2

source=/home/cristp/GenomeAnalysis/1_Zhang_2017/genomics_data/PacBio
output=/home/cristp/GenomeAnalysis/results/assembled/canu

canu -p assembled_canu -d $output genomeSize=3m gridOptions="-A uppmax2023-2-8 -t 09:00:00" -pacbio-raw $source/* &>> mycanulog
