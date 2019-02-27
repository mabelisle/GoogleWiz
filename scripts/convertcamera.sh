#!/bin/bash

if [ $# -eq 0 ]; then echo "Usage: convertcamera FOO.apk"; exit 1; fi
if [ $# -gt 1 ]; then echo "Usage: convertcamera FOO.apk"; exit 1; fi
if [ ! -e $1 ]; then echo "$1 does not exist!"; exit 1; fi


mkdir -p ~/convertcamera
rm -rf ~/convertcamera/*
echo "Starting camera conversion"
echo "Copying $1 ~/convertcamera/base.apk"
cp $1 ~/convertcamera/base.apk

cd ~/convertcamera
echo "Decompiling in `pwd`"
apktool d ~/convertcamera/base.apk 1> /dev/null

F1=~/convertcamera/base/smali/com/sec/android/app/camera/Camera.smali
F2=~/convertcamera/base/smali/com/sec/android/app/camera/interfaces/Constants.smali

echo "Patching $F1"
cat $F1 | sed -e 's/com.sec.android.gallery3d.app.GalleryActivity/com.google.android.apps.photos.pager.HostPhotoPagerActivity/g' > /tmp/foo
cp /tmp/foo $F1
cat $F1 | sed -e 's/com.sec.android.gallery3d/com.google.android.apps.photos/g' > /tmp/foo
cp /tmp/foo $F1

echo "Patching $F2"
cat $F2 | sed -e 's/com.sec.android.gallery3d.app.GalleryActivity/com.google.android.apps.photos.pager.HostPhotoPagerActivity/g' > /tmp/foo
cp /tmp/foo $F2
cat $F2 | sed -e 's/com.sec.android.gallery3d/com.google.android.apps.photos/g' > /tmp/foo
cp /tmp/foo $F2

echo "Compiling in `pwd`"
apktool b ~/convertcamera/base -c 1> /dev/null
echo "Result in" ~/convertcamera/base/dist/base.apk
