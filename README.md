# Fernando's dissertation

In this repository, you'll find all the scripts, files and materials needed to replicate Fernando's research. 

# Files description:

+ Workflow: a graphical summary of every step made to perform the analysys.
+ Script: **chlamyrnaseq.sh** was used to perform further DeSeq2 analysis. In order to do so, quality control was taken to each sample prior to *hisat2* and *stringtie*, which returned results in terms of a **.bw** file, taking account of *C. reinhardtii* annotation files.
+ Gene count matrix: the gene count matrix resulting from Python's interface **prepDE.py**, required for RStudio DeSeq2 analysis. 
+ pheno_data: a table with all the information (genotype and condition) of each sample, in the same order as the analysis that was taken.
+ R Markdown script: a step by step guide to my *C. reinhardtii* differential expression analysis. It is also available in **.pdf** and **.html**. 
