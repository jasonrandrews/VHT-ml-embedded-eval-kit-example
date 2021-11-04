#!/bin/bash

mydir="$(dirname $0)"

. $mydir/cmd.sh

git clone --recursive "https://review.mlplatform.org/ml/ethos-u/ml-embedded-evaluation-kit"

pushd ml-embedded-evaluation-kit

# Use build script from ML embedded eval kit quick start
# https://review.mlplatform.org/plugins/gitiles/ml/ethos-u/ml-embedded-evaluation-kit/+/HEAD/docs/quick_start.md

./build_default.py --npu-config-name ethos-u55-${NUM_MACS} --toolchain $TOOLCHAIN

popd
