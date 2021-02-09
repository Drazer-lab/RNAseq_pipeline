# Thesis-library
A depository for various scripts used in my PhD thesis.

Indexing folder contain all the scripts to create genome/transcriptome indices for the tools used in the pipelines

ChIP-seq_pipeline folder contains the bwa and MACS2 scripts for alignment and peakcalling, respectively.  
-	**bwa.sh** covers all steps including aligning fastq to sam, compressing sam to bam, sorting the bam file, and indexing the sorted bam.  
-	**MACS2.sh** is a script used to call peaks for the ChIP-seq alignment.
