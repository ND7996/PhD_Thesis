
reinitialize
set retain_order, 1
set stick_radius, 0.1
load solvated.pdb

create 433_1_0_0, byres (resi 433 expand 5)
disable 433_1_0_0

create 421_1_0_0, byres (resi 421 expand 5)
disable 421_1_0_0

create 407_1_0_0, byres (resi 407 expand 5)
disable 407_1_0_0

create 391_1_0_0, byres (resi 391 expand 5)
disable 391_1_0_0

create 384_1_0_0, byres (resi 384 expand 5)
disable 384_1_0_0

create 327_1_0_0, byres (resi 327 expand 5)
disable 327_1_0_0

create 309_1_0_0, byres (resi 309 expand 5)
disable 309_1_0_0

create 307_1_0_0, byres (resi 307 expand 5)
disable 307_1_0_0

create 272_1_0_0, byres (resi 272 expand 5)
disable 272_1_0_0

create 262_1_0_0, byres (resi 262 expand 5)
disable 262_1_0_0

create 258_1_0_0, byres (resi 258 expand 5)
disable 258_1_0_0

create 267_1_1_0, byres (resi 267 expand 5)
disable 267_1_1_0

create 279_0_1_0, byres (resi 279 expand 5)
disable 279_0_1_0

create 259_0_1_0, byres (resi 259 expand 5)
disable 259_0_1_0

create 266_0_2_0, byres (resi 266 expand 5)
disable 266_0_2_0

create 306_1_0_2, byres (resi 306 expand 5)
disable 306_1_0_2

hide
show sticks
hide sticks, solvated
show cartoon, solvated

