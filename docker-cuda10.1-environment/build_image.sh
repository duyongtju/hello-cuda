#!/usr/bin/env bash

IMG=${IMG:-cuda10.1-env:test}

set -ex

BOOST_VERSION=1.73.0
BOOST_VERSION_=1_73_0

if [ ! -f boost_${BOOST_VERSION_}.tar.gz ]; then
  wget --no-check-certificate https://sourceforge.net/projects/boost/files/boost/${BOOST_VERSION}/boost_${BOOST_VERSION_}.tar.gz/download -O boost_${BOOST_VERSION_}.tar.gz
fi

docker build \
  --network host \
  -f Dockerfile -t $IMG .

set +ex

echo "build image ${IMG}"