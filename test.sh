#!/bin/bash

echo "Replacing Samsung APKs with newer versions"
find ../GoogleWiz-Apps/sapps/system/app/* system/app/* -maxdepth 0 -type d | awk -F/ '{D[$NF]++} END {for (d in D) if (D[d]>1) print "rm -rf system/app/" d}' | sh
find ../GoogleWiz-Apps/sapps/system/priv-app/* system/priv-app/* -maxdepth 0 -type d | awk -F/ '{D[$NF]++} END {for (d in D) if (D[d]>1) print "rm -rf system/priv-app/" d}' | sh
