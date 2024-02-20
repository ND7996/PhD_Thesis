#!/bin/bash
#SBATCH -J amber_example
#SBATCH -e amber_example.%j.err
#SBATCH -o amber_example.%j.out
#SBATCH -p std
#SBATCH -n 1
#SBATCH -t 0-02:00

MOL=$1
 
module load apps/amber/18


#1.- Minimization steps
$PMEMD -O -i min1.in -o $1.min1.out -p $1.prmtop -c $1.inpcrd -r $1.m1.rst -ref $1.inpcrd
$PMEMD -O -i min2.in -o $1.min2.out -p $1.prmtop -c $1.m1.rst -r $1.m2.rst -ref $1.inpcrd
$PMEMD -O -i min3.in -o $1.min3.out -p $1.prmtop -c $1.m2.rst -r $1.m3.rst -ref $1.inpcrd

#2.- Heating (100 --> 300K)
$PMEMD -O -i h.in -o $1.h.out -p $1.prmtop -c $1.m3.rst -r $1.h.rst -x $1.h.nc -ref $1.m3.rst

#3.- Equilibration steps (=pre-production)
$PMEMD -O -i eq1.in -o $1.eq1.out -p $1.prmtop -c $1.h.rst -r $1.eq1.rst -x $1.eq1.nc -ref $1.h.rst
$PMEMD -O -i eq2.in -o $1.eq2.out -p $1.prmtop -c $1.eq1.rst -r $1.eq2.rst -x $1.eq2.nc -ref $1.eq1.rst
$PMEMD -O -i eq3.in -o $1.eq3.out -p $1.prmtop -c $1.eq2.rst -r $1.eq3.rst -x $1.eq3.nc -ref $1.eq2.rst
$PMEMD -O -i eq4.in -o $1.eq4.out -p $1.prmtop -c $1.eq3.rst -r $1.eq4.rst -x $1.eq4.nc -ref $1.eq3.rst
$PMEMD -O -i eq5.in -o $1.eq5.out -p $1.prmtop -c $1.eq4.rst -r $1.eq5.rst -x $1.eq5.nc -ref $1.eq4.rst
$PMEMD -O -i eq6.in -o $1.eq6.out -p $1.prmtop -c $1.eq5.rst -r $1.eq6.rst -x $1.eq6.nc -ref $1.eq5.rst

rm -f $1.md0.rst
ln -s $1.eq6.rst $1.md0.rst


