#PBS -N cufflinks
#PBS -S /bin/bash
#PBS -l walltime=48:00:00
#PBS -l nodes=1:ppn=8
#PBS -l mem=16gb
#PBS -o ./cufflinks.out
#PBS -e ./cufflinks.err


date
module load cufflinks

########## EDIT THE FOLLOWING SECTION ##########

cd /home/zcao2/godley-lab/jcao/RNAseq/TF-1_JQ1/Alignment # Provide the path to the .bam files.
# link to the .gtf file with the transcript annotation. .gff files do not work with cufflinks
index=/home/zcao2/godley-lab/jcao/Annotation/hg19_gtf/Updated_gencode/gencode.v31lift37.annotation.gtf
samples=($(cut -f3 cufflinks_list.txt)) # This is just the last column from the align_list.txt
outdir=../Cufflinks # Directory to save the output

########## END OF EDITING ZONE ##########

mkdir $outdir

for i in ${samples[@]}
do
	date
	echo "Begin cufflinks for "$i"."
	mkdir $outdir/$i
	cufflinks -o $outdir/$i -p 8 -G $index $i\_sort.bam 
done

echo END

date
