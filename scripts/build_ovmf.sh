#!/bin/bash

# Set build variables
ACTIVE_PLATFORM="OvmfPkg/OvmfPkgX64.dsc"
TARGET="DEBUG"
TARGET_ARCH="X64"
TOOL_CHAIN_TAG="GCC5"

cd /root/

# Clone the EDK II repository if not already present
if [ ! -d "edk2" ]; then
  git clone https://github.com/tianocore/edk2.git
fi

# Update submodules
cd edk2
git submodule update --init

# Build the BaseTools project
make -C BaseTools

# Set up the EDK II environment
source edksetup.sh

# Build OVMF
build -a "${TARGET_ARCH}" -t "${TOOL_CHAIN_TAG}" -p "${ACTIVE_PLATFORM}" -b "${TARGET}"

