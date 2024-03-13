#!/usr/bin/env python3

import sys
import statistics as stats
import logging
from Qpyl.core.qstructure import QStruct, QStructError
logger = logging.getLogger('Qpyl')

try:
    fn = sys.argv[1]
    cutoff=float(sys.argv[2])**2
except (IndexError, ValueError):
    print("Usage: {}  <structure.pdb> <cutoff>".format(sys.argv[0]))
    sys.exit(1)

try:
    qstr = QStruct(sys.argv[1], 'pdb', ignore_errors=True)
except QStructError as e:
    print("Failed to parse: {}".format(e))

# find indexes of solute and solvent heavy atoms
wats = []
solute = []
for i, at in enumerate(qstr.atoms):
    if at.name.startswith("H"):
        continue

    if at.residue.name in ["HOH", "SPC"]:
        wats.append(i)
    else:
        solute.append(i)

print("Solute heavy atoms: ", len(solute))
print("Solvent molecules: ", len(wats))
print("Using a cut-off of: ", sys.argv[2])
print("Finding contacts...")

# find within cutoff (optimization is the root of all evil)
contacts = {}
for wi in wats:
    # hydrophobic, aromatic, polar
    contacts[wi] = ([], [], [])
    c1 = qstr.atoms[wi].coordinates

    for si in solute:
        c2 = qstr.atoms[si].coordinates
        x2 = (c1.x - c2.x)**2
        if x2 < cutoff:
            y2 = (c1.y - c2.y)**2
            if y2 < cutoff:
                z2 = (c1.z - c2.z)**2
                if z2 < cutoff:
                    d2 = x2 + y2 + z2
                    if d2 < cutoff:
                        d = d2**0.5
                        if qstr.atoms[si].name[0] in ["O", "N", "S", "F"]:
                            contacts[wi][2].append((si, d))
                        elif qstr.atoms[si].residue.name in ["TYR", "PHE", "TRP", "POP"]:
                            contacts[wi][1].append((si, d))
                        else:
                            contacts[wi][0].append((si, d))

# calculate arbitrary score and make sortable list
# (lower score == better contacts)
SCALE_AROMATIC = -0.2
SCALE_POLAR = -1.2

nonpolar_totals = []
wats_scores = []
for wi in contacts:
    hcount, acount, pcount = map(len, contacts[wi])
    score = hcount + SCALE_AROMATIC*acount + SCALE_POLAR*pcount

    rindex = qstr.atoms[wi].residue.index_struct
    wats_scores.append((score, hcount, acount, pcount, wi, rindex))
    nonpolar_totals.append(hcount)

wats_scores.sort(reverse=True)

ncontact_cutoff = max(nonpolar_totals)/2
print()
print("Largest number of non-polar contacts: ", ncontact_cutoff*2)
print("Cut-off used for PyMol script: ", ncontact_cutoff)


# write out pretty score list and pymol script
outf = "{:>6}{:>10}{:>10}{:>10}{:>10}    {}\n" 
outf2 = "{:>6d}{:>10.1f}{:>10d}{:>10d}{:>10d}    {}\n" 

with open(fn + ".scores", "w") as f, open(fn + ".pml", "w") as f2:
    f.write(outf.format("#Index", "Score", "N_phobic",
                        "N_arom.", "N_polar", "Polar contacts"))
    f2.write("""
reinitialize
set retain_order, 1
set stick_radius, 0.1
load {}
""".format(fn))

    for wat_scores in wats_scores:
        score, nh, na, np, wi, ri = wat_scores

        pcs = ["{}.{} ({:.2f})".format(qstr.atoms[ai].residue.index_struct,
                                       qstr.atoms[ai].name,
                                       float(d)) for ai,d in contacts[wi][2]]

        f.write(outf2.format(ri, score, nh, na, np, ", ".join(pcs)))

        if nh + na > ncontact_cutoff:
            f2.write("""
create {pi}, byres (resi {ri} expand 5)
disable {pi}
""".format(pi="{}_{}_{}_{}".format(ri, nh, na, np), ri=ri))
    
    f2.write("""
hide
show sticks
hide sticks, {obj1}
show cartoon, {obj1}

""".format(obj1=fn.replace(".pdb", "")))

print("Wrote '{}.scores'".format(fn))
print("Wrote '{}.pml'".format(fn))

