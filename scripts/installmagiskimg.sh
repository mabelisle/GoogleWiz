#!/sbin/sh

BB=/sbin/busybox

# if magisk.img.gz was not extracted by the updater-script we can't do much
if [ -f "/data/magisk.img.gz" ]; then
    # check for existing image, if there, leave it (will be patched in next step)
    # these are symlinks, just remove them
    $BB rm -f /data/magisk.img
    $BB rm -f /data/magisk
    # and remove the directory they were pointing to
    $BB rm -rf /data/adb/
    # just recreate the magisk image
    $BB mkdir -p /data/adb/
    $BB chown root.root /data/adb/
    $BB chmod 700 /data/adb/
    $BB gunzip /data/magisk.img.gz
    $BB mv /data/magisk.img /data/adb/magisk.img
    $BB chown root.root /data/adb/magisk.img
    $BB chmod 644 /data/adb/magisk.img
    # as of Magisk v17 below is no longer needed
    #$BB ln -s /data/adb/magisk.img /data/magisk.img
    $BB mkdir /data/adb/magisk/
    $BB chown root.root /data/adb/magisk/
    $BB chmod 755 /data/adb/magisk/
    # as of Magisk v17 below is no longer needed
    #$BB ln -s /data/adb/magisk /data/magisk
fi
