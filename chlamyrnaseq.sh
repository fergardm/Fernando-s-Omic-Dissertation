#!/bin/bash



## This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International$
## Author: Fernando Garrido Muñoz
## Date: May 2022
## Email: fergardm@gmail.com

SAMPLE_PATH=$1
SAMPLE=$2
RAWNAME=$3

cd ${SAMPLE_PATH}

## Sample quality control and read mapping to reference genome
fastqc ${RAWNAME}_R1_001.fastq.gz
fastqc ${RAWNAME}_R2_001.fastq.gz
hisat2 --dta -x ../../genome/index -1 ${RAWNAME}_R1_001.fastq.gz -2 ${RAWNAME}_R2_001.fastq.gz -S ${SAMPLE}.sam

## Generating sorted bam file
samtools sort -o ${SAMPLE}.bam ${SAMPLE}.sam
#  .sam & fastq.gz deletion (raw data!!)
rm ${SAMPLE}.sam
#rm *.fastq.gz
# bam file index
samtools index ${SAMPLE}.bam
# reformat .bam into a lighter format (like .bw)
# Use conversion type:  count per million (FPKM equivalent)
# Set a bs (bin size) of 5.
bamCoverage -bs 5 --normalizeUsing CPM --bam ${SAMPLE}.bam -o ${SAMPLE}.bw

## Transcript assembly
stringtie -G ../../annotation/Creinhardtii_281_v5.6.gene.gff3 -o ${SAMPLE}.gff3 -l ${SAMPLE} ${SAMPLE}.bam

# Full transcriptome preparation:
# Transcriptome will be saved in results directory

## Preparing merge list file for transcriptome merging
echo ${SAMPLE_PATH}/${SAMPLE}.gff3 >> ../../results/merge_list.txt

## Gene Expression Quantification
stringtie -e -B -G ../../annotation/Creinhardtii_281_v5.6.gene.gff3 -o ${SAMPLE}.gff3 ${SAMPLE}.bam

# .bam deletion. We can use .bw file for IGV visualization
rm *.bam

# Changing the .gff3 format of each sample into .gtf for prepDE.py

mv ${SAMPLE}.gff3 ${SAMPLE}.gtf

# End
