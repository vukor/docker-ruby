#!/bin/sh

RUBY_VERSION="1.9"

if ruby --version | grep ${RUBY_VERSION}
then
  echo "test passed"
  exit 0
fi

echo "test failed"
exit 1

