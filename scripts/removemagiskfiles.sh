#!/sbin/sh

rm -rf /data/*magisk*
rm -rf /data/cache/*magisk*
rm -rf /data/property/*magisk*
rm -rf /data/Magisk.apk
rm -rf /data/busybox
rm -rf /data/custom_ramdisk_patch.sh
rm -rf /data/adb/*magisk*
rm -rf /data/user*/*/*magisk*
rm -rf /data/app/*magisk*
rm -rf /data/magisk.img
rm -rf /data/magisk_merge.img
rm -rf /data/busybox
rm -rf /data/magisk
rm -rf /data/custom_ramdisk_patch.sh

mount /cache
rm -rf /cache/magisk.log
rm -rf /cache/last_magisk.log
rm -rf /cache/magiskhide.log
rm -rf /cache/.disable_magisk
rm -rf /cache/magisk
rm -rf /cache/magisk_merge
rm -rf /cache/magisk_mount
rm -rf /cache/unblock
rm -rf /cache/magisk_uninstaller.sh 
umount /cache
