#PBS -N merge
#PBS -S /bin/bash
#PBS -l walltime=48:00:00
#PBS -l nodes=1:ppn=4
#PBS -l mem=16gb
#PBS -o ./merge.out
#PBS -e ./merge.err

########## EDIT THE FOLLOWING SECTION ##########

cd /home/zcao2/godley-lab/jcao/RNAseq/TF-1_JQ1/fastq # Provide the path to the .fastq.gz files. Use pwd on command line to get the full path.

########## END OF EDITING ZONE ##########

input1=($(cut -f1 merge_list.txt))
input2=($(cut -f2 merge_list.txt))
output=($(cut -f3 merge_list.txt))

n=${#input1[@]}
i=0
while [ "$i" -lt "$n" ]
do
	date
	echo "Current index: "$i". Merging files "${input1[$i]}" and "${input2[$i]}" to "${output[$i]}"."
	gunzip ${input1[$i]}.fastq.gz ${input2[$i]}.fastq.gz
	cat ${input1[$i]}.fastq ${input2[$i]}.fastq > ${output[$i]}.fastq
	gzip ${input1[$i]}.fastq  ${input2[$i]}.fastq  ${output[$i]}.fastq
	i=$((i+1))
date
done

echo END

