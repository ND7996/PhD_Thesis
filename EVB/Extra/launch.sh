rm -rf /home/nayanika/gamess/restart/$1.*
./rungms $1.inp 00 1 > $1.out
