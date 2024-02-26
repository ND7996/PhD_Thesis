from Qpyl.qmakefep import make_fep
fepstring = make_fep(qmap_file="../fepcysmouse.qmap", 
                        pdb_file="GPX6cys_mouse.pdb", 
                        forcefield="oplsaa",
                        parm_files=["../../LIB/qoplsaa_all.prm"],
                        lib_files=["../../LIB/qoplsaa.lib", "../../LIB/GPX.lib"])
open("GPX6_wtmousecys.fep", "w").write(fepstring)