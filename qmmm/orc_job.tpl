! xTB TIGHTSCF NOSOSCF SLOWCONV
%scf
    MaxIter 250
end
%method
    Grid 4
    FinalGrid 6
end
! PBE
#%geom end
! def2-SVP def2/J
%basis end
%output end
%pal
    nprocs 8 
end
%maxcore 32000
