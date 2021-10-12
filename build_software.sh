#!/bin/bash

# Ethos-U55 supports 32, 64, 128, or 256 8x8 MAC units
if [ $# -eq 1 ]
then
    NUM_MACS=$1
else
    NUM_MACS=128 # default value
fi

echo "Number of MACs is $NUM_MACS"

git clone --recursive "https://review.mlplatform.org/ml/ethos-u/ml-embedded-evaluation-kit"
sed -i -E 's/8.1-M.Main.dsp/cortex-m55/g' ml-embedded-evaluation-kit/scripts/cmake/toolchains/bare-metal-armclang.cmake
curl -L https://github.com/ARM-software/ML-zoo/blob/master/models/image_classification/mobilenet_v2_1.0_224/tflite_uint8/mobilenet_v2_1.0_224_quantized_1_default_1.tflite?raw=true --output mobilenet_v2_1.0_224_quantized_1_default_1.tflite
mv mobilenet_v2_1.0_224_quantized_1_default_1.tflite ml-embedded-evaluation-kit/

pushd ml-embedded-evaluation-kit
vela mobilenet_v2_1.0_224_quantized_1_default_1.tflite --accelerator-config=ethos-u55-${NUM_MACS} --config scripts/vela/default_vela.ini --memory-mode Shared_Sram --system-config Ethos_U55_High_End_Embedded
mkdir -p build && cd build 
cmake \
    -DTARGET_PLATFORM=mps3 \
    -DTARGET_SUBSYSTEM=sse-300 \
    -DCMAKE_TOOLCHAIN_FILE=scripts/cmake/toolchains/bare-metal-armclang.cmake \
    -DUSE_CASE_BUILD=img_class \
    -Dimg_class_MODEL_TFLITE_PATH=output/mobilenet_v2_1.0_224_quantized_1_default_1_vela.tflite \
    -DCMAKE_BUILD_TYPE=Debug \
    ..
make -j8
popd
