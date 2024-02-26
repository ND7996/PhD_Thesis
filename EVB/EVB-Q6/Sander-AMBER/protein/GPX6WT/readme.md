# Running Empirical Valence Bond Simulations 


## Preparing the files

1. gpx structure from  alphafold/pdb - **GPx6.pdb**

2. gpx from openMM (some coordinates) after simulation (dcd) - **GPX6_water.pdb**

3. name the active cys into sec in pdb file

4. making one water molecule into hydrogen peroxide (the substrate) near the SEC - **gpx6_h2o2**

5. to get the center of mass of the protein, install https://github.com/harmslab/pdbtools 
run $HOME/github/pdbtools/scripts/pdb_centermass GPX6_h2o2.pdb

##   Yielding
GPX6_h2o2.pdb    29.8115   34.5378   33.1485
but we want the coordinates of the cys/sel atom
ATOM    763  SG  SEC X  49      31.600  26.188  24.196  1.00  0.00

1. setting the sphere of water molecules around the selenium
boundary sphere 49:SG (residue number:residue type) and radius
solvate 49:SG 20.  grid - HOH

# Input
1. One library file for my system reactants and products - **GPX.LIB**
2. All Library file - **qoplsaa.lib**
3. One Parameter file (required ones for my system) - **GPX_PARAM.log**
Take the GPX6_h2o2.pdb , only add o1 and o2 of hydrogen peroxide.

# Results of Qprep6

1. makes the topology file - **GPX6_wt.top**
2. writes topology file - **GPX6_wt.top**
3. writes pdb file -  **GPX6_wt.pdb**


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

