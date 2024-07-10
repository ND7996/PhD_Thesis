# Running Empirical Valence Bond Simulations with Q6


## Parameterization

1. Using the gpx6 structure from md simulation (alphafold in case of human and pdb id 7fc2 in case of mouse) remove the hydrogens using the command remove hydro in pymol. input file - /protein_stepwise/GPX6WT/mousecys/1-prep/no_hyd.pdb
2. Obtaining the parameters for SEC gpx6 in its active site using maestro (ffld server)
   
**QPREP**

1. Reading the library file qoplsaa.lib from qtools
2. Reading the parameters file along with selenium parameters from maestro qoplsaa_all.prm
3. Preparing a new GPX.lib file which includes - 

5. setting the sphere of water molecules around the selenium and cystiene 
boundary sphere 49:SG and 49:SE (residue number:residue type) and radius solvate 49:SG 25. 49:SE 25.

# Output of QPREP

1. makes the topology file 
2. writes topology file 
3. writes pdb file 


# Making the qmap file

1. Create a file with the all quantum atoms that participate in the reaction (state 1 - reactant), (state 2 - product) (The file contains the PDB ID and corresponding LIB ID for it) - **fep.qmap**
2. Run the script to make the fep file -**makeFEP.py**

# Running Relaxation

Once the fep file is generated with the script, we will use this file further for relaxing the system

# Command
1. Setting the time-step, temperature, cut-offs, restraints -**genrelax.proc**
2. Use the script **q_genrelax.py** from qtools/qscripts-cli
3. Topology file - **GPX6_wt.top**
4. Running Qdyn6 on every relax input to obtain the dcd, restart and log files - **run_qdyn.sh**
5. Pdb file - **GPX6_wt.pdb**
6. Fep file - **GPX6_wt.fep**

# Results of Relax

1. Log file - energy summaries and temperature is written to the standard output log file
2. DCD - trajectory file
3. Restart file

# Running FEP calculation

# Command
1. run qdyn6 on each replica file
2. collect all .en files in an .inp file
3. for running the Qfep6 on .en (energy) files in the input - command Qfep6 < fep.inp > fep.out : **run in the parent folder**

# Results of FEP
1. gives the dG and dg values to create the free energy plots

# Creating Plots

Commands to create plots
q_analysefeps.py --qfep_out Qfep.out replica001/ - **run in WT (parent) folder**-  creates a file qaf.PlotData.json

#Visualizing the trajectories in vmd

# concatenate dcd
mdconvert -o all.dcd -t ~/OneDrive/Thesis/EVB/GPX_EVB/CALCS/WT/GPX6_wt.pdb fep_000_0.900.dcd fep_001_0.880.dcd fep_002_0.860.dcd
