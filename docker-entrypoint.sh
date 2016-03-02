#!/bin/bash

source ~/.bash_profile
test -d /blog && cd /blog

exec "$@"

