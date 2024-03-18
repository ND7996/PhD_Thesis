rm -rf /home/nayanika/scratchq6/mousecys_1
rm -rf replicamousecys*
relax=/home/nayanika/scratchq6/mousecys_1
source $HOME/github/qtools/qtools_init.sh 
dir=`pwd` 
replica=$HOME/Onedrive/Thesis/EVB/GPX_EVB/CALCS/WT/replica00
echo '##################################################'
echo 'running qprep6'
echo '##################################################'
Qprep6 <prepgpx6mousecys.inp
echo '##################################################'
echo 'running makefep'
echo '##################################################'
python makeFEPmousecys.py
#does not create the file with atoms corresponsing to topolgy and needs to be manually created 
# creates generatedGPX6_wt.fep - the atom number corresponds to q atom numbers in qmap.fep, manually need to be edited to topology number

#INPUT RELAX

echo '##################################################'
echo 'running qgenrelax'
echo '##################################################'
cp /home/OneDrive/Thesis/EVB/GPX_EVB/CALCS/WT/correctedGPX6_mousecys.fep $relax
$HOME/github/qtools/qscripts-cli/q_genrelax.py ../genrelax.proc \
          --top GPX6cys_mouse.top \
          --rs ../../COMMON/run_qdyn.sh \
          --pdb GPX6cys_mouse.pdb  \
          --fep correctedGPX6_mousecys.fep\
          --outdir $relax
cd $relax
#QDYN ON RELAX INPUT

echo '##################################################'
echo 'running run_qdyn'
echo '##################################################'
ls
sh run_qdyn.sh
echo $dir
cd $dir
ls

#INPUT FOR FEP

echo '##################################################'
echo 'running qgenfep'
echo '##################################################'
$HOME/github/qtools/qscripts-cli/q_genfeps.py ../genfeps.proc $relax/relax_008.inp relax \
          --rs ../../COMMON/run_qdyn.sh \
           --repeats 2 \
           --frames 51 \
           --fromlambda 0.90 \
           --pdb GPX6cys_mouse.pdb \
           --prefix replicamousecys



#$HOME/github/qtools/qscripts-cli/q_genrelax.py ../genrelax.proc --top GPX6_wt.top --rs ../../COMMON/run_qdyn.sh --pdb GPX6_wt.pdb --fep correctedGPX6_wt.fep --outdir relax



#~/github/qtools/qscripts-cli/q_genfeps.py ../genfeps.proc ~/scratchq6/relax_wt/relax_008.inp relax --rs ../../COMMON/run_qdyn.sh --repeats 10 --frames 51 --fromlambda 0.90 --pdb GPX_wtnew.pdb --fep correctedGPX6_wtnew.fep --prefix replica









