from Qpyl.qmakefep import make_fep
fepstring = make_fep(qmap_file="fepmousecys.qmap", 
                        pdb_file="GPX6cys_mouserestart.pdb", 
                        forcefield="oplsaa",
                        parm_files=["qoplsaa_all.prm"],
                        lib_files=["qoplsaa.lib", "GPX.lib"])
open("GPX6_wtmousecys.fep", "w").write(fepstring)