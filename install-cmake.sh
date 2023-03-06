#!/bin/bash

# Check if OpenSSL is installed
if ! dpkg -s libssl-dev >/dev/null 2>&1; then
    echo "OpenSSL not found. Installing OpenSSL..."
    sudo apt-get update
    sudo apt-get install libssl-dev
fi

# Download CMake archive
wget https://cmake.org/files/v3.22/cmake-3.22.1.tar.gz

# Extract archive
tar -xzf cmake-3.22.1.tar.gz

# Change to CMake directory
cd cmake-3.22.1

# Configure, build and install CMake
./bootstrap
make
sudo make install

# Check CMake version
cmake --version

# Remove generated resources
function cleanup {
    echo "Cleaning up..."
    cd ..
    rm -rf cmake-3.22.1.tar.gz cmake-3.22.1
}
trap cleanup EXIT
