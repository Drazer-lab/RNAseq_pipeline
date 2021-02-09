#PBS -N cuffdiff
#PBS -S /bin/bash
#PBS -l walltime=48:00:00
#PBS -l nodes=1:ppn=8
#PBS -l mem=16gb
#PBS -o ./cuffdiff.out
#PBS -e ./cuffdiff.err

date
module load cufflinks

########## EDIT THE FOLLOWING SECTION ##########

cd /home/zcao2/godley-lab/jcao/RNAseq/TF-1_JQ1/Alignment # Provide the path to the .bam files.
# path to the .gtf transcriptome annotation file. .gff file will not work with cuffdiff.
index=/home/zcao2/godley-lab/jcao/Annotation/hg19_gtf/Updated_gencode/gencode.v31lift37.annotation.gtf
outdir=../Cuffdiff  # Directory to save the output

########## END OF EDITING ZONE ##########


label1=($(cut -f1 cuffdiff_list.txt))

condition1=($(cut -f2 cuffdiff_list.txt))

label2=($(cut -f3 cuffdiff_list.txt))

condition2=($(cut -f4 cuffdiff_list.txt))

mkdir $outdir

n=${#label1[@]} 
i=0
while [ $i -lt $n ]
do
	date
	echo "Current index: "$i". Running cuffdiff for "${label1[$i]}" and "${label2[$i]}". Input #1: "${condition1[$i]}"; input #2: "${condition2[$i]}"."
	sub_outdir=$(echo ${label1[$i]}\_vs_${label2[$i]})
	mkdir $outdir/$sub_outdir
	cuffdiff -o $outdir/$sub_outdir -p 8 -L ${label1[$i]},${label2[$i]} -max-bundle-frags 10000000 $index ${condition1[$i]} ${condition2[$i]}
	i=$((i+1))
done
echo END
