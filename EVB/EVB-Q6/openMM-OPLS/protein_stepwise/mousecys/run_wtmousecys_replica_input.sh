#INPUT FOR FEP
rm -rf replicamousecys*
source $HOME/github/qtools/qtools_init.sh 

echo '##################################################'
echo 'running qgenfep'
echo '##################################################'
$HOME/github/qtools/qscripts-cli/q_genfeps.py genfeps.proc /home/nayanika/github/PhD_Thesis/EVB/EVB-Q6/openMM-OPLS/protein_concerted/GPX6WT/mousecys/relax/relax_012.inp relax \
          --rs run_qdyn.sh \
           --repeats 5 \
           --frames 51 \
           --fromlambda 0.90 \
           --pdb GPX6cys_mouse.pdb \
           --prefix replicamousecys


