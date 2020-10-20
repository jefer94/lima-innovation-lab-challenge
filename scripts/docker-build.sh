#!/bin/sh

build() {
  echo ======================= $1 =======================
  docker build ./$1 \
    -t lima/$1
    # --rm=false \
}

if [ $1 ]; then
  build "$1"
else
  build api
  # build web
fi
