from Qpyl.qmakefep import make_fep
fepstring = make_fep(qmap_file="../fepcys.qmap", 
                        pdb_file="GPX_wthumancys.pdb", 
                        forcefield="oplsaa",
                        parm_files=["../../LIB/qoplsaa_all.prm"],
                        lib_files=["../../LIB/qoplsaa.lib", "../../LIB/GPX.lib"])
open("GPX6_wtnewcys.fep", "w").write(fepstring)