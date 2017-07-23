REM fuse-utils-1.3.2-win32\profile2map.exe s1.profile s1.map
REM d:\Soft\Python3\python skoolkit-6.0\sna2skool.py -H -g s1.ctl -M s1.map s1.z80

d:\Soft\Python3\python skoolkit-6.0\sna2skool.py -h -H -c s1.ctl s1.z80 > s1.skool

d:\Soft\Python3\python skoolkit-6.0\skool2html.py s1.skool

d:\Soft\Python3\python skoolkit-6.0\skool2asm.py s1.skool > s1.asm
sjasmplus-win64\sjasmplus.exe --sym=s1_gen.sym s1.sjasm
d:\Soft\Python3\python skoolkit-6.0\bin2sna.py -s 48570 -p 23344 s1_gen.bin
REM d:\Soft\Python3\python skoolkit-6.0\snapmod.py -r iy=51394 -r ix=57478 -s iff=0 -f s1_gen.z80
d:\Soft\Python3\python skoolkit-6.0\snapmod.py -s border=0 -s iff=0 -f s1_gen.z80
