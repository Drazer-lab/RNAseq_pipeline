#!/bin/bash
#PBS -N bwa_ChIP
#PBS -S /bin/bash
#PBS -l walltime=48:00:00
#PBS -l nodes=1:ppn=4
#PBS -l mem=128gb
#PBS -o ./bwa.out
#PBS -e ./bwa.err

# load required modules
module load gcc/6.2.0
module load bwa/0.7.15
module load samtools/1.3.1

# provide path to where all .fastq.gz files are stored.
cd /home/zcao2/godley-lab/jcao/ChIP/K562_HIF/fastq

# provide path to the index files 
HG19=/home/zcao2/godley-lab/jcao/hg19

# make a new directory to store the output files
mkdir Alignment

for i in *.fastq.gz # loop the following lines through all files that ends with .fastq.gz
do
	j=${i%.fastq.gz} # removing the extension of the file and store in variable j. e.g. "example.fastq.gz" becomes "example", which is assigned to the variable j.
	gunzip $i # unzipping the sequencing file. "example.fastq.gz" becomes "example.fastq"
	bwa mem $HG19/hg19.fa $j.fastq > Alignment/$j.sam # align reads and save the output (.sam) to the new folder. "example.fastq" produces "Alignment/example.sam"
	gzip $j.fastq # zip the used sequencing file to conserve space. "example.fastq" becomes "example.fastq.gz"
	samtools view -bS  Alignment/$j.sam > Alignment/$j.bam # compress the plain text .sam file to binary .bam file. "Alignment/example.sam" produces "Alignment/example.bam"
	samtools sort Alignment/$j.bam -o Alignment/$j.sort.bam # sort bam files. "Alignment/example.bam" produces "Alignment/example.sort.bam"
	samtools index Alignment/$j.sort.bam # index sorted bam files. "Alignment/example.sort.bam" produces "Alignment/example.sort.bam.bai"
	rm Alignment/$j.sam Alignment/$j.bam # remove intermediate files
done

echo END

