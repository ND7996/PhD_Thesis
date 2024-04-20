Open in maestro
Click Protein Preparation - Preparation workflow
- **Preprocess** - Cap termini and fill the missing side chains
- **check structures** - add hydrogens if required from EDIT - ADD HYDROGENS
- **3D builder** - Adds carbon, oxygen, charges etc
- **optimize** - this step checks the propka and adds flips whereever required
- export the structure as .mae (maestroGPX6_wt.mae) file from maestro


1. Convert the .mae file into parameter from maestro using ffld_server.

 Command - /opt/schrodinger2022-1/utilities/ffld_server -imae maestro GPX6_wt.mae -version 14 -print_parameters -out_file GPX_PARAM.log


/opt/schrodinger2022-1/utilities/ffld_server -ipdb h2o2.pdb -print_parameters -version 14 > h2o2_param.ffld11


2. Creating the .prm , .lib , .prm.chk using the q_ffld2q.py

 Required:
  ffld_output  ffld_server output  ,   pdb  PDB structure file WHICH WAS USED TO CREATE THE FFLD_OUTPUT

**Command : q_ffld2q.py (go to qtools)  h2o2_param.ffld11 h2o2.pdb**

**Preparing a Tripeptide In Maestro**

1. Create the amino acid peptide chain (add fragments) using 3D builder of desired amino acids (add fragments - amino acid)
2. Mutate the Cys to Selenocystiene using the - Set element of selected atom in 3D builder
3. Select other edits - change atom properties - change residue name to SEL

4. All Parameter file -  **gpxqoplsaa_all.prm**
5. One PDB file with the protein and the substrate - **GPX6_h2o2.pdb**
Creating the params for selenol and seleninic acid

for SEC and SNN, that the molecules are, in fact, residues that form part of a chain, to create a couple of tripeptides, each of them with the named residues in the center, and surrounded by valines. This is: VUV and VXV, being U selenocystiene and X selenenic acid.Once we get the ffld file with the parameters and the corresponding .prm, remove all interactions that correspond exclusively to valine, not the bond, angles and torsions that connect aminoacids.
