#PBS -N hisat2
#PBS -S /bin/bash
#PBS -l walltime=200:00:00
#PBS -l nodes=1:ppn=8
#PBS -l mem=16gb
#PBS -o ./hisat2.out
#PBS -e ./hisat2.err

module load gcc/6.2.0
module load hisat2/2.1.0
module load samtools/1.3.1

########## EDIT THE FOLLOWING SECTION ##########

cd /home/zcao2/godley-lab/jcao/RNAseq/TF-1_JQ1/fastq # Provide the path to the .fastq.gz files. Use pwd on command line to get the full path.
index=/gpfs/data/godley-lab/hisat2_hg19_RNA_index/hg19_rna_reference # This is the transcriptome reference from Step 0. DON'T include the file extensions ".1.ht2" etc.
outdir=../Alignment # Folder to store the output. If it doesn't exist this script will create it.

########## END OF EDITING ZONE ##########

input1=($(cut -f1 align_list.txt))
output=($(cut -f2 align_list.txt))

mkdir $outdir

i=0
n=${#input1[@]}
while [ "$i" -lt "$n" ]
do
	date
	echo "Current index: "$i". Aligning files "${input1[$i]}" and "${input2[$i]}" to "${output[$i]}"."

	hisat2 -p 8 -x $index -U ${input1[$i]}.fastq.gz -S $outdir/${output[$i]}.sam

	samtools view -bS $outdir/${output[$i]}.sam > $outdir/${output[$i]}.bam
	samtools sort -o $outdir/${output[$i]}\_sort.bam $outdir/${output[$i]}.bam
	samtools index $outdir/${output[$i]}\_sort.bam
	rm $outdir/${output[$i]}.sam $outdir/${output[$i]}.bam

	i=$((i+1))
done

echo END

