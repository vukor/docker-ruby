#!/bin/sh

RUBY_VERSION="1.8"

if ruby --version | grep ${RUBY_VERSION}
then
  echo "test passed"
  exit 0
else
  echo "test failed"
  exit 1
fi

exit 1

