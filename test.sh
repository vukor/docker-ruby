#!/bin/sh

RUBY_VERSION="1.8"

ruby --version | grep -v ${RUBY_VERSION} && (echo "test ops not pass" && exit 1)

echo "test ops pass"
exit 0

