rm -rf replicacys*
source $HOME/github/qtools/qtools_init.sh 
dir=`pwd` 
relax=$HOME/scratchq6/relax_wt
replica=$HOME/Onedrive/Thesis/EVB/GPX_EVB/CALCS/WT/replica00
echo '##################################################'
echo 'running qgenfep'
echo '##################################################'
$HOME/github/qtools/qscripts-cli/q_genfeps.py /home/nayanika/OneDrive/Thesis/EVB/GPX_EVB/CALCS/genfeps.proc $relax/relax_008.inp relax \
          --rs /home/nayanika/OneDrive/Thesis/EVB/GPX_EVB/COMMON/run_qdyn.sh \
           --repeats 10 \
           --frames 51 \
           --fromlambda 0.90 \
           --pdb /home/nayanika/OneDrive/Thesis/EVB/GPX_EVB/CALCS/WT/GPX_wtnew.pdb \
           --prefix replicasec
