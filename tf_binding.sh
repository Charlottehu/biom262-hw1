#!/bin/csh
#PBS -q hotel
#PBS -N biom262-hw1
#PBS -l nodes=1:ppn=1
#PBS -l walltime=0:50:00
#PBS -m abe
# Yiren did exercise 1-3
# Exercise 1
cd ~/code/biom262-2016/weeks/week01/data
cat tf.bed|awk -F "\t" '{if($4 == "NFKB") {print;}}' > tf.nfkb.bed
# Exercise 2
cd ~/code/biom262-2016/weeks/week01/data
cat gencode.v19.annotation.chr22.gtf|awk -F "\t" '{if($3 == "transcript") {print;}}' > gencode.v19.annotation.chr22.transcript.gtf
# Exercise 3
cd ~/code/biom262-2016/weeks/week01/data
module load biotools
bedtools flank -i gencode.v19.annotation.chr22.transcript.gtf -g hg19.genome -l 2000 -r 0 -s > gencode.v19.annotation.chr22.transcript.promoter.gtf

# Soohwan add exercise 4-6
# Excercise 4
module load biotools
bedtools intersect -a gencode.v19.annotation.chr22.transcript.promoter.gtf \
                             -b tf.nfkb.bed > gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf
# Excercise 5
module load biotools
touch gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta
bedtools getfasta -s -fi GRCh37.p13.chr22.fa -bed gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf -fo gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta

echo "Hello I am a message in standard error (stderr)"
echo "Hello I am a message in standard out (stdout)" 

