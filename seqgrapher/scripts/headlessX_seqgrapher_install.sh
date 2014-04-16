#!/bin/bash
Xvfb :1 -screen 0 800x600x16 2>&1 >/dev/null & sleep 10 &&
export DISPLAY=:1.0 &&
Rscript /scripts/seqgrapher_install.R
