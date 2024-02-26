rm -rf /home/nayanika/github/Thesis/EVB/GPX6WT/testmousecys/relax
rm -rf relax
relax=/home/nayanika/github/Thesis/EVB/GPX6WT/testmousecys/relax
source /home/nayanika/github/qtools/qtools_init.sh 
dir=`pwd` 
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
cp /home/nayanika/github/Thesis/EVB/GPX6WT/testmousecys/correctedGPX6_mousecys.fep /relax
/home/nayanika/github/qtools/qscripts-cli/q_genrelax.py genrelax.proc \
          --top GPX6cys_mouse.top \
          --rs  run_qdyn.sh \
          --pdb GPX6cys_mouse.pdb  \
          --fep correctedGPX6_mousecys.fep\
          --outdir relax
cd relax
cd $relax














