rm -rf $relax
rm -rf replicamousesec*
source $HOME/github/qtools/qtools_init.sh 
dir=`pwd` 
relax=$HOME/scratchq6/mousesec
replica=$HOME/Onedrive/Thesis/EVB/GPX_EVB/CALCS/WT/replica00
echo '##################################################'
echo 'running qprep6'
echo '##################################################'
Qprep6 <prepgpx6mousesec.inp
echo '##################################################'
echo 'running makefep'
echo '##################################################'
python makeFEP.py
#does not create the file with atoms corresponsing to topolgy and needs to be manually created 
# creates generatedGPX6_wt.fep - the atom number corresponds to q atom numbers in qmap.fep, manually need to be edited to topology number
echo '##################################################'
echo 'running qgenrelax'
echo '##################################################'
cp /home/Onedrive/Thesis/EVB/GPX_EVB/CALCS/WT/GPX6_wtmousesecnew.fep $relax
$HOME/github/qtools/qscripts-cli/q_genrelax.py ../genrelax.proc \
          --top GPX6sec_mouse.top \
          --rs ../../COMMON/run_qdyn.sh \
          --pdb GPX_wtnewcys.pdb  \
          --fep GPX6_wtmousesecnew.fep\
          --outdir $relax
cd $relax
echo '##################################################'
echo 'running run_qdyn'
echo '##################################################'
ls
sh run_qdyn.sh
echo $dir
cd $dir
ls
echo '##################################################'
echo 'running qgenfep'
echo '##################################################'
$HOME/github/qtools/qscripts-cli/q_genfeps.py ../genfeps.proc $relax/relax_008.inp relax \
          --rs ../../COMMON/run_qdyn.sh \
           --repeats 10 \
           --frames 51 \
           --fromlambda 0.90 \
           --pdb GPX_wtnewcys.pdb \
           --prefix replicamousesec



#$HOME/github/qtools/qscripts-cli/q_genrelax.py ../genrelax.proc --top GPX6_wt.top --rs ../../COMMON/run_qdyn.sh --pdb GPX6_wt.pdb --fep correctedGPX6_wt.fep --outdir relax



#~/github/qtools/qscripts-cli/q_genfeps.py ../genfeps.proc ~/scratchq6/relax_wt/relax_008.inp relax --rs ../../COMMON/run_qdyn.sh --repeats 10 --frames 51 --fromlambda 0.90 --pdb GPX_wtnew.pdb --fep correctedGPX6_wtnew.fep --prefix replica









