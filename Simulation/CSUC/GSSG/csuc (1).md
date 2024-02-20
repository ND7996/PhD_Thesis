# CESCA/CSUC supercomputer

### First of all log in from your terminal with your user and password. The password will be asked for change once you're logged in.

```
ssh -p2122 <youruser>@hpc.csuc.cat
```
### Now you're connected you can start working whatever you want. To import files into the HPC Cluster:

```
scp -P 2122 <remote_file_path>:<youruser>@hpc.csuc.cat <local_file_path>
```

scp -P 2122 min1.in biotectfg05@hpc.csuc.cat:/home/biotectfg05/GSSG



### Finally if you want to launch a batch job, first of all you need to create one. Follow the example (the one I followed for molecular dynamics with amber):

```
#!/bin/bash
#SBATCH -J amber_example
#SBATCH -e amber_example.%j.err
#SBATCH -o amber_example.%j.out
#SBATCH -p std
#SBATCH -n 1
#SBATCH -t 0-02:00
 
module load apps/amber/18
 
##
#  Modify the input and output files!
 
cp -r ${SLURM_SUBMIT_DIR}/{min1.in,MouseCysGSSG.top,MouseCysGSSG.crd} ${SCRATCH}
cd ${SCRATCH}
  
srun pmemd.MPI -O \
               -i amber_example.inp \
               -p amber_example.top \
               -c amber_example.crd \
               -o amber_example.out
  
cp ./*.out ${SLURM_SUBMIT_DIR}

```
### In this example we find: -J= name for the job's allocation; -e= name of the sterr redirection filename; -o=name of the stdout redirection filename; -p=name of the partition (queue) where the job will be submited; -n=number of tasks; -t= set the job's time limit. In my case I created the following file:

```
#!/bin/bash
#SBATCH -J mdgfp
#SBATCH -e %J.%j.err
#SBATCH -o %J.%j.out
#SBATCH -p gpu
#SBATCH -n 1
#SBATCH -t 0-10:00

module load apps/amber/22

##
#  Modify the input and output files!

cp -r ${SLURM_SUBMIT_DIR}/{*.in,*.parm7,*.rst7} ${SCRATCH}
cd ${SCRATCH}

sander -O -i md.in -p gfp.parm7 -c heat.rst7 -o md1.mdout \
       -x md1.nc -r md1.rst7
cp ./*.mdout ${SLURM_SUBMIT_DIR}
```
### Once you have your script written, you have to submited, by simply running this command:

```
sbacth file.whataver
```
