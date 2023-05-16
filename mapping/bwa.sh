#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 04:00:00
#SBATCH -J cristi_qc
#SBATCH -o job.out
#SBATCH -e job.err
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user cristian-catalin.pop.9828@student.uu.se

module load bioinfo-tools bwa/0.7.17 samtools/1.17

assembly=/home/cristp/GenomeAnalysis/results/assembled/canu/assembled_canu.contigs.fasta
output=/home/cristp/GenomeAnalysis/results/mapping/
BH_reads=/home/cristp/GenomeAnalysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/trim_paired_
Serum_reads=/home/cristp/GenomeAnalysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_

bwa index $assembly

bwa mem $assembly ${BH_reads}ERR1797972_pass_1.fastq.gz ${BH_reads}ERR1797972_pass_2.fastq.gz | samtools sort -o $output/ERR1797972.bam
bwa mem $assembly ${BH_reads}ERR1797973_pass_1.fastq.gz ${BH_reads}ERR1797973_pass_2.fastq.gz | samtools sort -o $output/ERR1797973.bam
bwa mem $assembly ${BH_reads}ERR1797974_pass_1.fastq.gz ${BH_reads}ERR1797974_pass_2.fastq.gz | samtools sort -o $output/ERR1797974.bam

bwa mem $assembly ${Serum_reads}ERR1797969_pass_1.fastq.gz ${Serum_reads}ERR1797969_pass_2.fastq.gz | samtools sort -o $output/ERR1797969.bam
bwa mem $assembly ${Serum_reads}ERR1797970_pass_1.fastq.gz ${Serum_reads}ERR1797970_pass_2.fastq.gz | samtools sort -o $output/ERR1797970.bam
bwa mem $assembly ${Serum_reads}ERR1797971_pass_1.fastq.gz ${Serum_reads}ERR1797971_pass_2.fastq.gz | samtools sort -o $output/ERR1797971.bam