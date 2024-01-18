#!/bin/bash
#############################

#SBATCH -J relax
#SBATCH -n 1
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err
#SBATCH -D .

#############################
rm -rf /home/ndas/cysM/relaxcysmouse
rm -rf replicamousecys*
source /home/ndas/qtools/qtools_init.sh 
dir=`pwd` 
relax=/home/ndas/cysM/relaxcysmouse
#replica=$HOME/Onedrive/Thesis/EVB/GPX_EVB/CALCS/WT/replica00
/home/ndas/qtools/qscripts-cli/q_genrelax.py /home/ndas/cysM/genrelax.proc \
          --top /home/ndas/cysH/GPX6cys_mouse.top\
          --rs /home/ndas/cysH/run_qdyn.sh \
          --pdb /home/ndas/cysH/GPX6cys_mouse.pdb \
          --fep /home/ndas/cysH/correctedGPX6_mousecys.fep \
          --outdir $relax
cd /home/ndas/cysH/relaxcysmouse
echo '##################################################'
echo 'running run_qdyn'
echo '##################################################'
ls
sh run_qdyn.sh
cd /home/ndas/cysH/relaxcysmouse
ls
echo '##################################################'
echo 'running qgenfep'
echo '##################################################'
/home/ndas/bin/qtools/qscripts-cli/q_genfeps.py /home/ndas/cysM/genfeps.proc relax_008.inp relax --rs /home/ndas/cysH/run_qdyn.sh --repeats 2 --frames 51 --fromlambda 0.90 --pdb /home/ndas/cysH/GPX6cys_mouse.pdb  --prefix replicamousecys
