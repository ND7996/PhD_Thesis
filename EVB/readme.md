# Running Empirical Valence Bond Simulations with Q6


## Parameterization

1. Using the gpx6 structure from md simulation (alphafold in case of human and pdb id 7fc2 in case of mouse) remove the hydrogens using the command remove hydro in pymol. input file - /protein_stepwise/GPX6WT/mousecys/1-prep/no_hyd.pdb
2. Obtaining the parameters for SEC gpx6 in its active site using maestro (ffld server)
   
**QPREP**

1. Reading the library file qoplsaa.lib from qtools
2. Reading the parameters file along with selenium parameters qoplsaa_all.prm
3. Preparing a new GPX.lib file which includes the library entries of those not present in the qoplsaa.lib
   - Hydrogen peroxide , Selenol, Selenenic Acid, Selenolate ion and protonated glutamine
4. Setting the sphere of water molecules around the selenium and cystiene 
boundary sphere 49:SG and 49:SE (residue number:residue type) and radius solvate 49:SG 25. 49:SE 25. grid HOH

# Output of QPREP

1. makes the topology file 
2. writes topology file 
3. writes pdb file 

# Making the qmap file

1. Create a file with the all quantum atoms that participate in the reaction (state 1 - reactant), (state 2 - product) (The file contains the PDB ID and corresponding LIB ID for it) 
2. Run the script to make the fep file, it takes the topology, pdb after performing qprep and the original qoplsaa.lib, GPX.lib, qoplsaa_all.prm

# Fep file

Once the fep file is generated with the script, we will use this file further for relaxing the system. 

The fep file includes the change in the charges, bonds, torsions, impropers and angles , soft core potentials, Harmonic and Morse potentials for the bonds that are being made and broken

# Running Relaxation

1. Setting the steps, temperature, cut-offs, restraints -**genrelax.proc**
2. Use the script **q_genrelax.py** from qtools/qscripts-cli
3. Topology file from Qprep
4. Pdb file from Qprep
5. Fep file 

# Run this command to generate inputs.
q_genrelax.py genrelax.proc --top GPX6cys_mouse.top  --pdb GPX6cys_mouse.pdb --fep GPX6_wtmousecys.fep --outdir minim --rest top --rs run_Q5.10_amd.sh

Run run_Q5.10_amd.sh , it runs Qdyn6 on every relax input to obtain the dcd, restart and log files 

# Output of Relax

1. Log file - energy summaries and temperature is written to the standard output log file
2. DCD - trajectory file
3. Restart file

# Writing a new Pdb file from the last restart file after minimization 

1. Reading the library file qoplsaa.lib from qtools        
2. Reading the parameter file  qoplsaa_all.prm
3. Reading the topology file from Qprep
4. Reading the last restart file

# Output

1- The minimised pdb structure used to run FEP calculations

# Running FEP calculation

1. run qdyn6 on each replica file
2. collect all .en files in an .inp file
3. for running the Qfep6 on .en (energy) files in the input - command Qfep6 < fep.inp > fep.out : **run in the parent folder**

# Results of FEP
1. gives the dG and dg values to create the free energy plots

# Creating Plots

Commands to create plots
q_analysefeps.py --qfep_out Qfep.out replica001/ - **run in WT (parent) folder**-  creates a file qaf.PlotData.json

# Visualizing the trajectory movie

1. catdcd -o combined.dcd input*.dcd

