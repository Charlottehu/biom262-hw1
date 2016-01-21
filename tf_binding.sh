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
