#!/bin/bash
#SBATCH --job-name=Gaussian16_Job
#SBATCH --partition=cpu
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=4
#SBATCH --mem=10GB

g16root="/software/g16"
export g16root GAUSS_SCRDIR
source ${g16root}/g16/bsd/g16.profile
#name of the input file
input=$1

#create scratch space for the job
export GAUSS_SCRDIR=/scratch/slurm_temp/${USER}/${input}/${SLURM_JOB_ID}
tempdir=${GAUSS_SCRDIR}
mkdir -p ${tempdir}

# copy input and checkpoint file to scratch directory
SLURM_SUBMIT_DIR=$PWD
cp ${SLURM_SUBMIT_DIR}/${input}.com ${tempdir}
if [ -f "${SLURM_SUBMIT_DIR}/${input}.chk" ]; then
    cp ${SLURM_SUBMIT_DIR}/${input}.chk ${tempdir}
fi
# run the code
cd ${tempdir}
g16 ${input}.com > ${input}.log

# copy output and checkpoint file back
cp ${input}.log ${SLURM_SUBMIT_DIR}

# remove the scratch directory after the job is done
# cd ${SLURM_SUBMIT_DIR}
 rm -rf /scratch/slurm_temp/${USER}/${input}/${SLURM_JOB_ID}

exit 0



