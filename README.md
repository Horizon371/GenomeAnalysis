# Project plan

## Overview

Enterococcus faecium is a gram positive bacterium that is a frequent cause of bloodstream infections in hospitalized patients. Its acquired resistance to multiple antibiotics has led to a public health concern.

The project entails the analysis of transcriptomics data to determine the expression patterns of E.faecium in different mediums. In order to apply the transcriptomics data, the complete genomic sequence of the E745 E. faecium strain has been determined through a combination of short-read Illumina sequencing and long-read Pacific Biosciences and Oxford Nanopore sequencing.

Our goal is to identify which genes allow the proliferation of E. faecium in human blood.


## Software and Analyses

Basic analyses:

* Genome assembly with PacBio reads.
* Genome assembly with Illumina and Nanopore reads.
* Assembly evaluation.
* Structural and functional annotation.
* Synteny comparison with a closely related genome.
* Reads preprocessing: trimming + quality check (before and after)
* RNA-Seq reads alignment against the assembled genome.
* Differential expression analysis between rich medium and heat-inactivated serum
conditions.
* Plasmid identification.

## Time plan

| Analysis Step | Software | Input | Output |  Time  | Status | Deadline |
|  ------- |  -------- | ------- | -------- | ------- | ----- | --------- |
| Read Quality Control | Fast QC | FASTQ files | data quality report | 10 min | Done | 03.04
| Reads preprocessing | Trimmomatic | FASTQ files | trimmed fasta files | 50 min | Done | 03.04
| DNA assembly | Spades / Canu | FastQ files | assembly fasta file | 2 h / 4,5 h | Done | 11.04
| Assembly evaluation | MUMmerplot / Quast | FastQ files | assembly evaluation report | 5 min | Done | 11.04
| Annotation | Prokka | FastQ file | Annotation GFF file | 5 min | Done | 13.04
| Aligner | BWA | FastQ files | BAM files | 30 min | Done | 14.04
| Differential Expression | Htseq / DESeq | BAM / Gene count files | Gene count files  | 2 - 7 h | Done | 19.04

## Data management

```
.
└── genome analysis/
    ├── analysis/
    │   └── preprocessing/
    │       ├── trimmed/
    │       │   ├── trimmed_file1.fastq
    │       │   └── trimmed_file2.fastq
    │       ├── fastq_raw/
    │       │   └── report.txt
    │       └── fastq_trim/
    │           └── report.txt
    ├── code/
    │   ├── script1.sh
    │   └── script2.sh
    └── data/
        ├── metadata
        ├── raw_data/
        │   ├── genomics_data/
        │   │   ├── Illumina
        │   │   ├── Pacbio
        │   │   └── Nanopore
        │   └── transcriptomics_data/
        │       ├── RNA-Seq_BH
        │       ├── RNA-Seq_Serum
        │       ├── Tn-Seq_BHI
        │       ├── Tn-Seq_HSerum
        │       └── Tn-Seq_Serum
        └── trimmed_data

```

Original paper: [RNA-seq and Tn-seq reveal fitness determinants of vancomycin-resistant Enterococcus faecium during growth in human serum](https://pubmed.ncbi.nlm.nih.gov/29162049/)
