from Qpyl.qmakefep import make_fep
fepstring = make_fep(qmap_file="fepsecmouse.qmap", 
                        pdb_file="GPX6sec_mouse.pdb", 
                        forcefield="oplsaa",
                        parm_files=["qoplsaa_all.prm"],
                        lib_files=["qoplsaa.lib", "GPX.lib"])
open("GPX6_wtmousesec.fep", "w").write(fepstring)