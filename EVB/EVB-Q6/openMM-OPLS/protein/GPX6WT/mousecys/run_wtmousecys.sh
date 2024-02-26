rm -rf /home/nayanika/OneDrive/Thesis/EVB/GPX6WT/mousecys/relax
rm -rf replicamousecys*
rm -rf relax
relax=/home/nayanika/OneDrive/Thesis/EVB/GPX6WT/mousecys/relax
source $HOME/github/qtools/qtools_init.sh 
dir=`pwd` 
replica=/home/nayanika/OneDrive/Thesis/EVB/GPX6WT/mousecys/replica00
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

#mkdir relax
cp /home/nayanika/OneDrive/Thesis/EVB/GPX6WT/mousecys/correctedGPX6_mousecys.fep /relax
$HOME/github/qtools/qscripts-cli/q_genrelax.py genrelax.proc \
          --top GPX6cys_mouse.top \
          --rs  run_qdyn.sh \
          --pdb GPX6cys_mouse.pdb  \
          --fep correctedGPX6_mousecys.fep\
          --outdir relax
cd relax
cd $relax














