from Qpyl.qmakefep import make_fep
fepstring = make_fep(qmap_file="fepcysmouse.qmap", 
                        pdb_file="GPX6cys_mouse.pdb", 
                        forcefield="oplsaa",
                        parm_files=["/home/nayanika/OneDrive/Thesis/EVB/GPX6WT/mousecys/qoplsaa_all.prm"],
                        lib_files=["/home/nayanika/OneDrive/Thesis/EVB/GPX6WT/mousecys/qoplsaa.lib", "/home/nayanika/OneDrive/Thesis/EVB/GPX6WT/mousecys/GPX.lib"])
open("GPX6_wtmousecys.fep", "w").write(fepstring)