#!/bin/sh

ruby --version | grep -v '1.9' && exit 1

echo "Pass"
exit 0

