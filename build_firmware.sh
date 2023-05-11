#!/bin/bash

# docker build -t ovmf-builder .
# docker run -it -v "$(pwd)/Build:/root/edk2/Build" ovmf-builder

if [ ! -d "../OVMF" ]; then
    mkdir ../OVMF
fi

cp Build/OvmfX64/DEBUG_GCC5/FV/OVMF_CODE.fd  ../OVMF/OVMF_CODE.X64.debug.fd
cp Build/OvmfX64/DEBUG_GCC5/FV/OVMF_VARS.fd  ../OVMF/OVMF_VARS.X64.debug.fd