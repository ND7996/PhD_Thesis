from Qpyl.qmakefep import make_fep
fepstring = make_fep(qmap_file="fepmousesec.qmap", 
                        pdb_file="GPX6secmouse.pdb", 
                        forcefield="oplsaa",
                        parm_files=["qoplsaa_all1.prm"],
                        lib_files=["qoplsaa.lib", "GPX.lib"])
open("GPX6_wtmousesec.fep", "w").write(fepstring)