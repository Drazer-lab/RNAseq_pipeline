#!/bin/bash
#PBS -N samtoolsIndex
#PBS -S /bin/bash
#PBS -l walltime=8:00:00
#PBS -l nodes=1:ppn=4
#PBS -l mem=8gb
#PBS -o /home/zcao2/godley-lab/jcao/hg19/samtoolsIndex.out
#PBS -e /home/zcao2/godley-lab/jcao/hg19/samtoolsIndex.err

# load required modules
module load gcc/6.2.0
module load samtools/1.3.1

# index the reference genome
samtools faidx /home/zcao2/godley-lab/jcao/hg19/hg19.fa

echo END
