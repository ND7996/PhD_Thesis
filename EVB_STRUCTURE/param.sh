pdbname=alasecala #selenol
# first create the mae and pdb , but use the pdb file for proper numbering of all atoms to creating the ffld parameters 
/opt/schrodinger2022-1/utilities/ffld_server -ipdb $pdbname.pdb -version 14 -print_parameters -out_file $pdbname.ffld
q_ffld2q.py $pdbname.ffld $pdbname.pdb -o ../LIB/$pdbname
#sed 's/cys/sec/g' ../LIB/CYS.lib > ../LIB/temp.lib   # changing the residue name in the respective files.
#sed 's/cys/sec/g' ../LIB/CYS.prm > ../LIB/SEC.prm
#sed 's/CYS/SEC/g' ../LIB/temp.lib > ../LIB/SEC.lib

