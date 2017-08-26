#!/usr/bin/env bash
find . -type d -name "build" | xargs rm -rvf
find . -type f -name ".DS_Store" | xargs rm -rvf
