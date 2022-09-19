#!/bin/bash

solc-select use ${SOLC_VERSION}
python3 conkas.py "$@"
