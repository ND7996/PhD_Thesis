rm -rf /home/ndas/secH/relaxsechuman
rm -rf replicahumansec*
source /home/ndas/qtools/qtools_init.sh 
dir=`pwd` 
relax=/home/ndas/secH/relaxsechuman
#replica=$HOME/Onedrive/Thesis/EVB/GPX_EVB/CALCS/WT/replica00
/home/ndas/qtools/qscripts-cli/q_genrelax.py /home/ndas/secH/genrelax.proc \
          --top /home/ndas/secH/GPX_wtnew.top \
          --rs /home/ndas/secH/run_qdyn.sh \
          --pdb /home/ndas/secH/GPX_wtnew.pdb \
          --fep /home/ndas/secH/correctedGPX6_humansec.fep \
          --outdir $relax
cd /home/ndas/secH/relaxsechuman
echo '##################################################'
echo 'running run_qdyn'
echo '##################################################'
ls
sh run_qdyn.sh
cd /home/ndas/secH/relaxsechuman
ls
echo '##################################################'
echo 'running qgenfep'
echo '##################################################'
/home/ndas/bin/qtools/qscripts-cli/q_genfeps.py /home/ndas/secH/genfeps.proc relax_008.inp relax --rs /home/ndas/secH/run_qdyn.sh --repeats 2 --frames 51 --fromlambda 0.90 --pdb /home/ndas/secH/GPX_wtnew.pdb  --prefix replicahumansec
