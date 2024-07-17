# Running Empirical Valence Bond Simulation on Wild Type Glutathione Peroxidase


## Preparing the files

"Qprep6wt"

1. gpx structure from  alphafold - **GPx6.pdb**

2. gpx from openMM (some coordinates) (dcd) - **GPX6_water.pdb**

3. name the active cys into sec in pdb file

4. making one water molecule into hydrogen peroxide (the substrate) near the SEC - **gpx6_h2o2**

5. to get the center of mass of the protein, install https://github.com/harmslab/pdbtools and run $HOME/github/pdbtools/scripts/pdb_centermass GPX6_h2o2.pdb
##   Yielding
GPX6_h2o2.pdb    29.8115   34.5378   33.1485
but we want the coordinates of the cys/sel atom
ATOM    763  SG  SEC X  49      31.600  26.188  24.196  1.00  0.00

6. setting the sphere of water molecules around the selenium
boundary sphere 49:SG (residue number:residue type) and radius
solvate 49:SG 20.  grid - HOH

# Input -
1. One library file for my system reactants and products - **GPX.LIB**
2. All Library file - **qoplsaa.lib**
3. One Parameter file (required ones for my system) - GPX_PARAM.log
Take the GPX6_h2o2.pdb , only add o1 and o2 of hydrogen peroxide.
Open in maestro
Click Protein Preparation - Preparation workflow
- **Preprocess** - Cap termini and fill the missing side chains
- **check structures** - add hydrogens if required from EDIT - ADD HYDROGENS
- **3D builder** - Adds carbon, oxygen, charges etc
- **optimize** - this step checks the propka and adds flips whereever required
- export the structure as .mae (maestroGPX6_wt.mae) file from maestro
4. Convert the .mae file into parameter from maestro using ffld_server.

 Command - /opt/schrodinger2022-1/utilities/ffld_server -imae maestroGPX6_wt.mae -version 14 -print_parameters -out_file GPX_PARAM.log

 /opt/schrodinger2022-1/utilities/ffld_server -ipdb h2o2.pdb -print_parameters -version 14 > h2o2_param.ffld11

5. Creating the .prm , .lib , .prm.chk using the q_ffld2q.py

 Required:
  ffld_output  ffld_server output  ,   pdb  PDB structure file WHICH WAS USED TO CREATE THE FFLD_OUTPUT

**Command : q_ffld2q.py  h2o2_param.ffld11 h2o2.pdb**

**Preparing a Tripeptide In Maestro**

1. Create the amino acid peptide chain using 3D builder of desired amino acids (add fragments - amino acid)
2. Mutate the Cys to Selenocystiene using the - Set element of selected atom in 3D builder
3. Select other edits - change atom properties - change residue name to SEL

4. All Parameter file -  **gpxqoplsaa_all.prm**
5. One PDB file with the protein and the substrate - **GPX6_h2o2.pdb**
Creating the params for selenol and seleninic acid

for SEC and SNN, you need to work thinking that the molecuels are, in fact, residues that form part of a chain, to create a couple of tripeptides, each of them with the named residues in the center, and surrounded by valines. This is: VUV and VXV, being U selenocystiene and X selenenic acid.Once we get the ffld file with the parameters and the corresponding .prm, remove all interactions that correspond exclusively to valine, not the bond, angles and torsions that connect aminoacids.

# Results

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
2. Use the script **q_genrelax.py** from $HOME/github/qtools/qscripts-cli
3. Topology file - **GPX6_wt.top**
4. Running Qdyn6 on every relax input to obtain the dcd, restart and log files - **run_qdyn.sh**
5. Pdb file - **GPX6_wt.pdb **
6. Fep file - **GPX6_wt.fep**

# Results

1. Log file - energy summaries and temperature is written to the standard output log file
2. DCD - trajectory file
3. Restart file

# Running FEP calculation

# Command
1. run qdyn6 on each replica file
2. collect all .en files in an .inp file
3. for running the Qfep6 on .en (energy) files in the input - command : wt(standard input file)

# Results
1. gives the dG and dg values to create the free energy plots

# Plots

Commands to create plots
q_analysefeps.py --qfep_out Qfep.out replica001/ - **run in WT (parent) folder**-  creates a file qaf.PlotData.json




readprm  ../../LIB/h2o2.prm
readprm  ../../LIB/alasecala.prm
readprm  ../../LIB/alasnnala.prm
readprm  ../../LIB/alasenala.prm

/home/nayanika/OneDrive/Thesis/EVB/GPX_EVB/CALCS/WT/qaf4..json

/home/nayanika/OneDrive/Thesis/EVB/GPX_EVB/CALCS/WT/plotfep.ipynb

# concatenate dcd
mdconvert -o all.dcd -t ~/OneDrive/Thesis/EVB/GPX_EVB/CALCS/WT/GPX6_wt.pdb fep_000_0.900.dcd fep_001_0.880.dcd fep_002_0.860.dcd 