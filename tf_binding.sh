#!/bin/csh
#PBS -q hotel
#PBS -N biom262-hw1
#PBS -l nodes=10:ppn=2
#PBS -l walltime=0:50:00
#PBS -M y1hu@ucsd.edu, soo001@ucsd.edu, yeg002@ucsd.edu
#PBS -m abe
#PBS -A ucsd-train07, ucsd-train09, ucsd-train52
cd /oasis/tscc/scratch/ucsd-train07
mpirun -v -machinefile $PBS_NODEFILE -np 20 <./mpi.out
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

