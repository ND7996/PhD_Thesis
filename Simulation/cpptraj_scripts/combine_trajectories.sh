#!/bin/bash

# Source Amber environment
. /software/amber20/amber.sh

# Clean up previous runs
rm -f trajin.in rmsd.dat rmsd.lig.dat

# Create a new cpptraj input file
echo "reference ./GPX6Hcys.inpcrd" >> trajin.in

# Loop through the trajectory files and add them to the cpptraj input
for i in `seq 0 20 5000`; do
    bzip2 -df GPX6Hcys.md$i.rst.bz2  # Decompress the trajectory file
    echo "trajin ./GPX6Hcys.md$i.rst" >> trajin.in
done

# Add the cpptraj commands for processing and output
echo "autoimage
center origin :1-197
rms first :1-197@CA out rmsd250.dat mass
solvent byres :WAT
closestwaters 200 :46
trajout MD250.pdb PDB
trajout combined_trajectory.nc netcdf
go" >> trajin.in

# Run cpptraj with the generated input file
cpptraj -p ./GPX6Hcys.prmtop < trajin.in

# Clean up the temporary input file
rm trajin.in

echo "Combined trajectory written to combined_trajectory.nc"
