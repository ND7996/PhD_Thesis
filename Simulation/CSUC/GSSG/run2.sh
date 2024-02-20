#!/bin/bash
#SBATCH -J amber_example
#SBATCH -e amber_example.%j.err
#SBATCH -o amber_example.%j.out
#SBATCH -p std
#SBATCH -n 1
#SBATCH -t 0-02:00

MOL=$1
 
module load apps/amber/18

#$PMEMD -O -i md.in -o $1.md1.out -p $1.prmtop -c $1.md0.rst -r $1.md1.rst -x $1.md1.nc -ref $1.md0.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
#$PMEMD -O -i md.in -o $1.md2.out -p $1.prmtop -c $1.md1.rst -r $1.md2.rst -x $1.md2.nc -ref $1.md1.rst
