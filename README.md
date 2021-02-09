# Thesis-library
A depository for various scripts used in my PhD thesis.

All fastq files were first checked with fastqc for sequencing quality before the following steps.

Indexing folder contain all the scripts to create genome/transcriptome indices for the tools used in the pipelines

ChIP-seq pipeline folder contains the bwa and MACS2 scripts for alignment and peakcalling.  
-	**bwa.sh** covers all steps including aligning fastq to sam, compressing sam to bam, sorting the bam file, and indexing the sorted bam.  
-	**MACS2.sh** is a script used to call peaks for the ChIP-seq alignment.

RNA-seq pipeline folder contains the hisat2 and cufflinks scripts for alignment and expression quantification.  
- **merge.sh** is used to combine fastq files if sequencing results of a sample comes in 2 files. Requires the configure file **merge_list.txt** to work.
- **hisat2_se.sh** and **hisat2_pe.sh** are used to align single-end or paired-end reads, respectively. Requires the the corresponding configure file **align_list_se.txt** or **align_list_pe.txt** to work
- **cufflinks.sh** is used to quantify gene expressions. Requires the configure file **cufflinks_list.txt** to work.  
- **cuffdiff.sh** is used to find significant differences in expression in pair-wise comparison. Requires the configure file **cuffdiff_list.txt** to work.
