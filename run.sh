#!/bin/bash

# Ethos-U55 supports 32, 64, 128, or 256 8x8 MAC units
if [ $# -eq 1 ]
then
    NUM_MACS=$1
else
    NUM_MACS=128 # default value
fi

echo "Number of MACs is $NUM_MACS"

FVP_Corstone_SSE-300_Ethos-U55 -f FVP_config.txt -C ethosu.num_macs=${NUM_MACS} -a ml-embedded-evaluation-kit/build/bin/ethos-u-img_class.axf