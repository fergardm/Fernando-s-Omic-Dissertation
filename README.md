# Fernando's dissertation

In this repository, you'll find all the scripts, files and materials needed to replicate Fernando's research. 

# Files description:

+ Workflow: a graphical summary of every step made to perform the analysis.
+ Script: **chlamyrnaseq.sh** was used to perform further DeSeq2 analysis. In order to do so, quality control was taken to each sample prior to *stringtie*, which returned results in terms of a **.bw** file, taking account of *C. reinhardtii* annotation files.
+ Steps_processing.txt : code for genome indexing previous to script execution and for prepDE.py execution after script execution.
+ Gene count matrix: the gene count matrix resulting from Python's interface **prepDE.py**, required for RStudio DESeq2 analysis. 
+ pheno_data: a table with all the information (genotype and condition) of each sample, in the same order as the analysis that was taken.
+ Marker genes: three **.txt** files with the marker genes used in this study. They are neccessary for data analysis in RStudio.
+ DESeq2 analysis R Markdown script: a step by step guide to my *C. reinhardtii* differential expression analysis. It is also available in **.pdf** and **.html**. 


