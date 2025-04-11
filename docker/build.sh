#!/bin/sh

set -eu

echo "=== Prepare build environment ==="

apk --no-cache add build-base gmp-dev mpfr-dev mpc1-dev openmpi-dev readline-dev zlib-dev openssh tar wget
apk --no-cache add pari-dev flint-dev --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

echo "=== Build MPFRCX ==="

mkdir -p /tmp/mpfrcx
cd /tmp/mpfrcx

wget --no-verbose --output-document=mpfrcx.tar.gz "https://www.multiprecision.org/downloads/mpfrcx-0.6.3.tar.gz"
tar --strip-components 1 -zxf mpfrcx.tar.gz
./configure
make -j "$(nproc)"
make check
make install

cd /
rm -rf /tmp/mpfrcx

echo "=== Build CM ==="

mkdir -p /tmp/cm
cd /tmp/cm

wget --no-verbose --output-document=cm.tar.gz "https://www.multiprecision.org/downloads/cm-0.4.3.tar.gz"
tar --strip-components 1 -zxf cm.tar.gz
patch -p1 </cm.patch
./configure --enable-mpi
make -j "$(nproc)"
make check
make install

cd /
rm -rf /tmp/cm

echo "=== Clean up ==="

rm -rf /build.sh /cm.patch
apk del --purge build-base tar wget
