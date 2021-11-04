#!/bin/bash

usage() {
     echo "Usage: $0 " 1>&2
     echo "          [-t --toolchain] Specify the toolchain to use (Arm or GNU). Options are [gnu,arm]; default is gnu." 1>&2
     echo "          [-n --num-macs] Number of MACs in Ethos-U55. Options are [32, 64, 128, 256]; default is 256 " 1>&2
     echo "          [-h --help] prints help message " 1>&2
     exit 1
 }

# Process command line arguments
OPTS=`getopt -o t:n:h --long toolchain:,num-macs:,help -n 'parse-options' -- "$@"`
 
if [ $? != 0 ] ; then echo "Error: failed to parse options" >&2 ; exit 1 ; fi
 
eval set -- "$OPTS"
 
NUM_MACS=256
TOOLCHAIN="gnu"
 
 while true; do
   case "$1" in
     -t | --toolchain ) TOOLCHAIN=$2 ; shift 2;;
     -n | --num-macs ) NUM_MACS=$2 ; shift 2;;
     -h | --help ) usage ; shift ;;
     -- ) shift; break ;;
     * ) break ;;
   esac
 done

echo "Number of MACs is $NUM_MACS"
echo "Toolchain is $TOOLCHAIN"

