#!/bin/bash


#SBATCH --account=pi-foster
#SBATCH --job-name=pa-worker
#SBATCH --output=%x_%A_%a.out
#SBATCH --error=%x_%A_%a.err
#SBATCH --partition=broadwl
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=6000
#SBATCH --time=2:00:00

module load matlab/2017b

matlab -nodesktop -nosplash -r 'F5_19_auto; exit'
