#!/bin/bash
#############################
#SBATCH -J replica
#SBATCH -n 1
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err
#SBATCH -D .

#############################
echo '##################################################'
echo 'running run_qdyn'
echo '##################################################'

cd /home/ndas/cysH/relaxcyshuman/replicamousecys003
sh run_qdyn.sh
