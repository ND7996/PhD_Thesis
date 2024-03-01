#!/bin/bash
#SBATCH --job-name=mousecys
#SBATCH -o ./test-output-%j.txt
#SBATCH -e ./test-error-%j.txt
#SBATCH -D .
#SBATCH --ntasks=64

MOL=$1

###AMBER


module load python/3.8.8 intel/2022.3 mkl/2022.2.0 impi/2021.7.0 amber/22/intel/2022.3/impi/2021.7

export PMEMD="srun --mpi=pmi2 pmemd.MPI"



#$PMEMD -O -i md.in -o $1.md1.out -p $1.prmtop -c $1.md0.rst -r $1.md1.rst -x $1.md1.nc -ref $1.md0.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md3.out -p $1.prmtop -c $1.md2.rst -r $1.md3.rst -x $1.md3.nc -ref $1.md2.rst
#$PMEMD -O -i md.in -o $1.md4.out -p $1.prmtop -c $1.md3.rst -r $1.md4.rst -x $1.md4.nc -ref $1.md3.rst
#$PMEMD -O -i md.in -o $1.md5.out -p $1.prmtop -c $1.md4.rst -r $1.md5.rst -x $1.md5.nc -ref $1.md4.rst
#$PMEMD -O -i md.in -o $1.md6.out -p $1.prmtop -c $1.md5.rst -r $1.md6.rst -x $1.md6.nc -ref $1.md5.rst
$PMEMD -O -i md.in -o $1.md7.out -p $1.prmtop -c $1.md6.rst -r $1.md7.rst -x $1.md7.nc -ref $1.md6.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst

















##
