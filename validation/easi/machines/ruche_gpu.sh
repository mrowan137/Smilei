#!/bin/bash

#SBATCH --job-name=validation_smilei
#SBATCH --output=%x.o%j 
#SBATCH --time=00:20:00 
#SBATCH --ntasks=1                   # Number of MPI processes (= total number of GPU)
#SBATCH --ntasks-per-node=1          # nombre de tache MPI par noeud (= nombre de GPU par noeud)
#SBATCH --gres=gpu:1
#SBATCH --partition=gpua100 #_test
#SBATCH --exclude='ruche-gpu16','ruche-gpu17'

# Load necessary modules
#source /gpfs/users/prouveurc/env_smilei.sh
source /gpfs/users/prouveurc/myhdf5_env_smilei.sh
export LD_LIBRARY_PATH=/gpfs/softs/spack_1.0.2/opt/spack/linux-cascadelake/gettext-0.23.1-jjcwc7ug6uwmiippbgzkwmxe75xzny6u/lib/:$LD_LIBRARY_PATH
# Run cuda code
srun ./smilei input.py
