#!/bin/bash
#############################
#SBATCH -J replicas
#SBATCH -n 1
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err
#SBATCH -D .

#############################
echo '##################################################'
echo 'running run_qdyn'
echo '##################################################'

cd /home/ndas/cysH/relaxcyshuman/replicamousecys009
sh run_qdyn.sh
