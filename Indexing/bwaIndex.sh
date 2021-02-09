#!/bin/bash
#PBS -N bwaIndex
#PBS -S /bin/bash
#PBS -l walltime=8:00:00
#PBS -l nodes=1:ppn=4
#PBS -l mem=8gb
#PBS -o /home/zcao2/godley-lab/0_Test_Files/bwaIndex.out
#PBS -e /home/zcao2/godley-lab/0_Test_Files/bwaIndex.err

# load required module
module load gcc/6.2.0
module load bwa/0.7.15

# indexing the reference genome
bwa index -a bwtsw /home/zcao2/godley-lab/jcao/hg19/hg19.fa

echo END
