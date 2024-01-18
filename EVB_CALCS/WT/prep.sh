source $HOME/github/qtools/qtools_init.sh 
dir=`pwd` 
relax=$HOME/scratchq6/relax_wt
replica=$HOME/Onedrive/Thesis/EVB/GPX_EVB/CALCS/WT/replica00
echo '##################################################'
echo 'running qprep6'
echo '##################################################'
Qprep6 <prepgpx6new.inp
echo '##################################################'
echo 'running makefep'
echo '##################################################'
python makeFEP.py
echo '##################################################'
echo 'running qgenrelax'
echo '##################################################'
rm -rf $relax
cp correctedGPX6_wtnew /$HOME/Onedrive/Thesis/EVB/GPX_EVB/CALCS/WT $relax
$HOME/github/qtools/qscripts-cli/q_genrelax.py ../genrelax.proc \
          --top GPX_wtnew.top \
          --rs ../../COMMON/run_qdyn.sh \
          --pdb GPX_wtnew.pdb \
          --fep correctedGPX6_wtnew.fep \
          --outdir $relax
cd $relax
