#to run files on CSB

#CREATING RELAX INPUTS

#Run this command to generate inputs.
q_genrelax.py genrelax.proc --top GPX6cys_mouse.top  --pdb GPX6cys_mouse.pdb --fep GPX6_wtmousecys.fep --outdir minim --rest top --rs run_Q5.10_amd.sh

#CREATING FEP INPUTS

#Run this command to generate inputs.

q_genfeps.py genfeps.proc --pdb GPX6cys_mouse.pdb relax_008.inp relax --repeats 5 --frames 51 --fromlambda 0.90 --prefix replicamousecys --rs run_Q5.10_amd.sh


#RUNNING FEP

#Loading modules 

ml qtools
ml Q/5
ml list

#help with q-mapper tools

q_automapper.py 5.0 -10.0 10.0 -200.0 --temp 298 --dirs replicamousecys00? -h

#running mapper to map free energies

q_automapper.py 5.0 -10.0 0. 0. --temp 300 --dirs replicamousecys00? --qfep_exec qfep5

q_mapper.py 79.106841 -92.883878 --bins 50 --skip 100 --min 10 --temp 300.0 --dirs replica* --qfep_exec qfep5

#Contcatnate DCD

$ catdcd -o combined.dcd relax_01?.dcd

#Local computer

#plotting 

q_plot.py qaf.PlotData.json 