#!/bin/sh

# example script for automating several data taking runs
# Usage :
#  bash run_all.sh
#

for thres in {800..100..100}
do
    acquire.py -t 100 -s ~/code/CosmicRayExpt/DAQ/daq.cfg -o thresh"$thres"_chan0.txt -0 $thres -1 100 -2 100 -3 100 -e 0x1
    acquire.py -t 100 -s ~/code/CosmicRayExpt/DAQ/daq.cfg -o thresh"$thres"_chan1.txt -0 100 -1 $thres -2 100 -3 100 -e 0x2
    acquire.py -t 100 -s ~/code/CosmicRayExpt/DAQ/daq.cfg -o thresh"$thres"_chan2.txt -0 100 -1 100 -2 $thres -3 100 -e 0x4
    acquire.py -t 100 -s ~/code/CosmicRayExpt/DAQ/daq.cfg -o thresh"$thres"_chan3.txt -0 100 -1 100 -2 100 -3 $thres -e 0x8

    convert.py thresh"$thres"_chan0.txt thresh"$thres"_chan0.dat
    convert.py thresh"$thres"_chan1.txt thresh"$thres"_chan1.dat
    convert.py thresh"$thres"_chan2.txt thresh"$thres"_chan2.dat
    convert.py thresh"$thres"_chan3.txt thresh"$thres"_chan3.dat


done


##acquire.py -t 100 -o thresh100_chan0.txt -0 100 -1 100 -2 100 -3 100 -e 0x1
##convert.py thresh100_chan0.txt thresh100_channel0.dat

##acquire.py -t 100 -o thresh100_chan1.txt -0 100 -1 100 -2 100 -3 100 -e 0x2
##convert.py thresh100_chan1.txt thresh100_channel0.dat



##acquire.py -t 100 -o thresh200.txt -0 200 -1 200 -2 200 -3 200 -e 0x1
##acquire.py -t 100 -o thresh300.txt -0 300 -1 300 -2 300 -3 300 -e 0x1
##acquire.py -t 100 -o thresh400.txt -0 400 -1 400 -2 400 -3 400 -e 0x1
##acquire.py -t 100 -o thresh500.txt -0 500 -1 500 -2 500 -3 500 -e 0x1
##acquire.py -t 100 -o thresh600.txt -0 600 -1 600 -2 600 -3 600 -e 0x1
