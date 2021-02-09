#!/bin/bash
#PBS -N MACS_MYC
#PBS -S /bin/bash
#PBS -l walltime=48:00:00
#PBS -l nodes=1:ppn=8
#PBS -l mem=32gb
#PBS -e ./MACS2.err
#PBS -o ./MACS2.log
#PBS source ~/.bash_profile


# Load required modules
module load gcc/6.2.0
module load python/2.7.13

# Provide path to the directory where all the .bam files are stored
cd /home/zcao2/godley-lab/jcao/ChIP/K562_HIF/Alignment

# Define input (control)
INPUT="LG-1-JC-0_S1_L001_R1_001_sort.bam"

# Run MACS2. -t defines the pulldown, -c defines the control. -f defines the source file format. -g defines the genome. -n defines the output file names. --call-summits creates additional summit posision files in the output.
# note that the following examples are used to call transcription factor ChIP-seq. If you're doing histone modification ChIP, add the option --broad after callpeak.


macs2 callpeak -t LG-2-JC-1C_S2_L001_R1_001_sort.bam -c $INPUT -f BAM -g hs -n 1C --call-summits

macs2 callpeak -t LG-3-JC-1H_S3_L001_R1_001_sort.bam -c $INPUT -f BAM -g hs -n 1H --call-summits

macs2 callpeak -t LG-4-JC-2C_S4_L001_R1_001_sort.bam -c $INPUT -f BAM -g hs -n 2C --call-summits

macs2 callpeak -t LG-5-JC-2H_S5_L001_R1_001_sort.bam -c $INPUT -f BAM -g hs -n 2H --call-summits

macs2 callpeak -t LG-6-JC-3C_S6_L001_R1_001_sort.bam -c $INPUT -f BAM -g hs -n 3C --call-summits

macs2 callpeak -t LG-7-JC-3H_S7_L001_R1_001_sort.bam -c $INPUT -f BAM -g hs -n 3H --call-summits

echo END
