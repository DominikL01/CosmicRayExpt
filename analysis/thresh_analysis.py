#!/usr/bin/env python

# data analysis example program
# Including some examples of how to use DataFrames from pandas
#
# Usage :
# python analysis.py -i test.dat

import pickle
import numpy as np
import matplotlib.pyplot as plt
import argparse

from event import Event, Pulse

parser = argparse.ArgumentParser(description='Analyse CSV file')
parser.add_argument("-i", "--in_file", help="input file")
parser.add_argument("-o", "--out_file", help='output file')
parser.add_argument("-c", "--channel", help='channel (0 to 3)')


args = parser.parse_args()

print("Starting analysis")

# open the file
ifile = open(args.in_file, 'rb')
channel = args.channel
events= pickle.load(ifile)
n_events= len(events)

print("Read {} events from file".format(n_events))

# example event loop

count = [0,0,0,0]  # counts per channel

for event in events:
    for pulse in event.pulses:
        # only count rising edges
        if pulse.edge == 0:
            count[channel] += 1

print("Counts by channel")
print("Channel %d : %d "%(channel, count[channel])


# Add here some plotting


