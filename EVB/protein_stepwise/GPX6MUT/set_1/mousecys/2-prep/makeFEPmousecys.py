from Qpyl.qmakefep import make_fep
fepstring = make_fep(qmap_file="fepmousecys.qmap", 
                        pdb_file="GPX6cysmouse.pdb", 
                        forcefield="oplsaa",
                        parm_files=["qoplsaa_all2.prm"],
                        lib_files=["qoplsaa.lib", "GPX.lib"])
open("GPX6_wtmousecys.fep", "w").write(fepstring)