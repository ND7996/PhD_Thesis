#!/bin/bash
#############################

#SBATCH -J relax
#SBATCH -n 1
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err
#SBATCH -D .

#############################
rm -rf /home/ndas/secM/relaxsecmouse
rm -rf replicamousesec*
source /home/ndas/qtools/qtools_init.sh 
dir=`pwd` 
relax=/home/ndas/secM/relaxsecmouse
#replica=$HOME/Onedrive/Thesis/EVB/GPX_EVB/CALCS/WT/replica00
/home/ndas/qtools/qscripts-cli/q_genrelax.py /home/ndas/secM/genrelax.proc \
          --top /home/ndas/secM/GPX6sec_mouse.top\
          --rs /home/ndas/secM/run_qdyn.sh \
          --pdb /home/ndas/secM/GPX6sec_mouse.pdb \
          --fep /home/ndas/secM/GPX6_wtmousesecnew.fep \
          --outdir $relax
cd /home/ndas/secM/relaxsecmouse
echo '##################################################'
echo 'running run_qdyn'
echo '##################################################'
ls
sh run_qdyn.sh
cd /home/ndas/secM/relaxsecmouse
ls
echo '##################################################'
echo 'running qgenfep'
echo '##################################################'
/home/ndas/bin/qtools/qscripts-cli/q_genfeps.py /home/ndas/secM/genfeps.proc relax_008.inp relax --rs /home/ndas/secM/run_qdyn.sh --repeats 2 --frames 51 --fromlambda 0.90 --pdb /home/ndas/secM/GPX6sec_mouse.pdb  --prefix replicamousesec
