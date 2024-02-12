#!/bin/sh
#SBATCH --job-name=test
#SBATCH --partition=cpu
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=1
#SBATCH --mem=48GB

MOL=$1

. /software/amber22/amber.sh


export LD_LIBRARY_PATH="usr/local/lib:"$LD_LIBRARY_PATH
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/nayanika/software/orca_5_0_4_linux_x86-64_shared_openmpi411"

export PMEMD=/software/amber22/bin/pmemd.cuda
export SANDER=/software/amber22/bin/sander

export CUDA_HOME=/software/cuda-11.2
export mpirun="/software/openmpi/bin/mpirun -np 8"

export PATH=/software/cuda-11.2/bin${PATH:+:${PATH}}
export PATH=/software/orca_5.0.2/${PATH:+:${PATH}}


export TMPDIR=/scratch
export SLURM_TMPDIR=/scratch
export SLURM_SUBMIT_DIR=$PWD


$SANDER -O -i qmmm.in -o $1.qmmm.out -p $1.prmtop -c input.rst -r $1.qmmm.rst -x $1.qmmm.nc -ref input.rst





