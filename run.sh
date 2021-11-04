#!/bin/bash

mydir="$(dirname $0)"

. $mydir/cmd.sh

APP=ml-embedded-evaluation-kit/cmake-build-mps3-sse-300-ethos-u55-${NUM_MACS}-${TOOLCHAIN}/bin/ethos-u-img_class.axf

# specify compiler to use
if [ -f $APP ]; then
    FVP_Corstone_SSE-300_Ethos-U55 -f FVP_config.txt -C ethosu.num_macs=${NUM_MACS} -a $APP
else
    echo "Cannot file image classification application for $TOOLCHAIN and $NUM_MACS macs"
    echo "Looking for $APP"
fi


