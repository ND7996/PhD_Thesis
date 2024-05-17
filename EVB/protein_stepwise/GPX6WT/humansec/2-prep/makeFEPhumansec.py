from Qpyl.qmakefep import make_fep
fepstring = make_fep(qmap_file="fephumansec.qmap", 
                        pdb_file="GPX6sechuman.pdb", 
                        forcefield="oplsaa",
                        parm_files=["qoplsaa_all1.prm"],
                        lib_files=["qoplsaa.lib", "GPX.lib"])
open("GPX6_wthumansec.fep", "w").write(fepstring)