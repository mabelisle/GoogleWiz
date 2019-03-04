#!/bin/bash

if [ ! -e ./system ]
then
  echo "Can't find 'system' for ROM"
  exit 1
fi

if [ ! -e ./META-INF ]
then
  echo "Can't find 'META-INF' for ROM"
  exit 1
fi

# Remove temporary files left in folders
#find . -name '*~' -exec rm -rf {} \;
#find ~/Googlegiz/androidfiles -name '*~' -exec rm -rf {} \;

# Backup the build.prop file
cp system/build.prop system/build.prop.orig

# Main execution
main()
{
  echo "Deleting directories & files in system/"
  remove system/lost+found
  remove system/container
  remove system/preload
  remove system/tts
  remove system/voicebargeindata
  remove system/recovery-from-boot.p
  remove system/tima_measurement_info
  remove system/info.extra
  remove system/hidden

#============================================================================

  echo "Moving compatibility_matrix"
  mv system/compatibility_matrix.xml system/vendor
  
#============================================================================

  echo "Deleting files in system/framework/"
  remove system/framework/secsmartcard.jar
  remove system/framework/oat/arm/secsmartcard.odex
  remove system/framework/oat/arm64/secsmartcard.odex
  remove system/framework/com.dsi.ant.antradio_library.jar
  remove system/framework/oat/arm/com.dsi.ant.antradio_library.odex
  remove system/framework/oat/arm64/com.dsi.ant.antradio_library.odex
  remove system/framework/videoeditor_sdk.jar
  remove system/framework/oat/arm/videoeditor_sdk.vdex
  remove system/framework/oat/arm64/videoeditor_sdk.vdex
  remove system/framework/com.samsung.bbccommon.jar
  remove system/framework/oat/arm/com.samsung.bbccommon.odex
  remove system/framework/oat/arm/com.samsung.bbccommon.vdex
  remove system/framework/oat/arm64/com.samsung.bbccommon.odex
  remove system/framework/oat/arm64/com.samsung.bbccommon.vdex
  remove system/framework/gamemanager.jar
  remove system/framework/gamesdk.jar
  remove system/framework/gamesdkWrapper.jar
  remove system/framework/oat/arm/gamesdk.odex
  remove system/framework/oat/arm/gamesdk.vdex
  remove system/framework/oat/arm/gamesdkWrapper.odex
  remove system/framework/oat/arm/gamesdkWrapper.vdex
  remove system/framework/oat/arm64/gamesdk.odex
  remove system/framework/oat/arm64/gamesdk.vdex
  remove system/framework/oat/arm64/gamesdkWrapper.odex
  remove system/framework/oat/arm64/gamesdkWrapper.vdex
  remove system/framework/SecProductFeature_*.jar
  remove system/framework/oat/arm/allshare*
  remove system/framework/oat/arm64/allshare*
  remove system/framework/com.sec.android.app.multiwindow.jar
  remove system/framework/oat/arm/com.sec.android.app.multiwindow.odex
  remove system/framework/oat/arm/com.sec.android.app.multiwindow.vdex
  remove system/framework/oat/arm64/com.sec.android.app.multiwindow.odex
  remove system/framework/oat/arm64/com.sec.android.app.multiwindow.vdex

#============================================================================

  echo "Deleting directories & files in system/vendor/carrier"
  remove system/vendor/carrier

#============================================================================

  echo "Deleting directories & files in system/usr"
  remove system/usr/srec
  remove system/usr/keylayout/Vendor_*

#============================================================================

  echo "Deleting directories & files in system/etc"
  remove system/etc/restart_radio_process.sh
  remove system/etc/fs_config_dirs
  remove system/etc/fs_config_files
  remove system/etc/ringtones_count_list.txt
  remove system/etc/nfcee_access.xml
  remove system/etc/nfc_key
  remove system/etc/srm.bin
  remove system/etc/apks_count_list.txt
  remove system/etc/epdg_apns_conf.xml
  remove system/etc/tima
  remove system/etc/security_profile.dat # evolved packet data gateway (network security)
  remove system/etc/epdg
  remove system/etc/DefaultGrantPermission.xml
  remove system/etc/recovery-resource.dat
  remove system/etc/xtables.lock
  remove system/etc/old-apns-conf.xml
  remove system/etc/NOTICE.html.gz
  remove system/etc/feature_default.xml
  remove system/etc/irremovable_list.txt
  remove system/etc/ASKSTS.xml
  remove system/etc/removable_preload.txt
  remove system/etc/multisound_*
  remove system/etc/fota.cer
  remove system/etc/default-permissions/*
  remove system/etc/purenandpackages.txt
  remove system/etc/purenandpackages_pref.txt
  remove system/etc/nwk_info.xml
  remove system/etc/sapa_feature.xml
  remove system/etc/PAICheck.xml
  remove system/etc/userdata_apks_count_list.txt*
  remove system/etc/vpl_apks_count_list.txt*
  remove system/etc/security/oculus.crt

#============================================================================

  echo "Deleting files in system/etc/secure_storage"
  #Somehow deleting other files resulted in problems for banking app
  remove system/etc/secure_storage/com.samsung.android.personalpage.service
  remove system/etc/secure_storage/com.samsung.android.personalpage.service!dex
  #remove system/etc/secure_storage/com.samsung.android.securitylogagentsystem #(mabelisle) Folder Missing 2019-02-23
  remove system/etc/secure_storage/com.samsung.android.securitylogagent
  remove system/etc/secure_storage/com.samsung.android.securitylogagent!dex
  remove system/etc/secure_storage/com.samsung.android.fast
  remove system/etc/secure_storage/com.samsung.android.fast!dex
  remove system/etc/secure_storage/com.samsung.android.sm.devicesecurity*

#============================================================================

  echo "Deleting files in system/etc/preferred-apps"
  #remove system/etc/preferred-apps/browser.xml #(mabelisle) File Missing 2019-02-23
  remove system/etc/preferred-apps/com.samsung.android.email.provider.xml
  remove system/etc/preferred-apps/com.sec.android.gallery3d.xml

#============================================================================

  echo "Deleting files in system/etc/permissions"
  remove system/etc/permissions/knoxsdk_edm.xml
  remove system/etc/permissions/knoxsdk_mdm.xml
  #remove system/etc/permissions/com.verizon* #(mabelisle) Folder Missing 2019-02-23
  remove system/etc/permissions/shealth_sw_pedometer_paused.xml
  remove system/etc/permissions/sagearpolicymanager.xml
  remove system/etc/permissions/com.dsi.ant.antradio_library.xml
  remove system/etc/permissions/com.sec.android.app.minimode.xml
  remove system/etc/permissions/com.sec.android.app.multiwindow.xml
  remove system/etc/permissions/com.sec.feature.cocktailpanel.xml
  remove system/etc/permissions/com.sec.feature.cover.clearcover.xml
  remove system/etc/permissions/com.sec.feature.cover.flip.xml
  remove system/etc/permissions/com.sec.feature.cover.nfc_authentication.xml
  remove system/etc/permissions/com.sec.feature.cover.nfcledcover.xml
  remove system/etc/permissions/com.sec.feature.cover.sview.xml
  remove system/etc/permissions/com.sec.feature.cover.xml
  remove system/etc/permissions/com.sec.feature.edge_v03.xml
  remove system/etc/permissions/com.sec.smartcard.auth.xml
  remove system/etc/permissions/com.sec.android.smartface.smart_stay.xml
  remove system/etc/permissions/android.software.live_wallpaper.xml
  remove system/etc/permissions/android.software.verified_boot.xml
  remove system/etc/permissions/com.samsung.feature.galaxyfinder_v7.xml
  remove system/etc/permissions/com.samsung.feature.mirrorlink_fw_level8.xml
  #remove system/etc/permissions/com.samsung.feature.samsung_experience_mobile.xml #(mabelisle) Folder Missing 2019-02-23
  remove system/etc/permissions/com.sec.feature.multiwindow.ensure_docked_view.xml
  remove system/etc/permissions/com.sec.feature.multiwindow.long_device_snap_mode.xml
  remove system/etc/permissions/com.sec.feature.multiwindow.snap_view.xml
  remove system/etc/permissions/com.sec.feature.people_edge_notification.xml
  remove system/etc/permissions/com.samsung.feature.samsung_experience_mobile.xml
  remove system/etc/permissions/com.sec.feature.barcode_emulator.xml
  remove system/etc/permissions/com.sec.feature.findo.xml
  remove system/etc/permissions/com.sec.feature.slocation_level3.xml
  remove system/etc/permissions/privapp-permissions-com.android.wallpaper.livepicker.xml
  remove system/etc/permissions/privapp-permissions-com.knox.vpn.proxyhandler.xml
  remove system/etc/permissions/privapp-permissions-com.osp.app.signin.xml
  remove system/etc/permissions/privapp-permissions-com.policydm.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.app.accesscontrol.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.app.appsedge.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.app.assistantmenu.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.app.cocktailbarservice.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.app.color.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.app.galaxyfinder.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.gallery3d.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.mimage.photoretouching.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.app.ledcoverdream.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.app.multiwindow.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.app.omcagent.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.app.soundpicker.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.app.spage.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.app.stubupdater.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.app.taskedge.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.authfw.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.beaconmanager.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.bixby.agent.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.bixby.es.globalaction.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.bixby.wakeup.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.communicationservice.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.contacts.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.dqagent.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.easysetup.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.email.provider.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.fmm.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.game.gamehome.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.game.gametools.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.hmt.vrsvc.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.incallui.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.keyguardwallpaperupdator.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.knox.containeragent.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.knox.containercore.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.mateagent.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.messagingui.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.mobileservice.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.networkdiagnostic.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.rubin.app.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.samsungpass.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.scloud.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.service.peoplestripe.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.sm.devicesecurity_v6.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.smartface.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.spayfw.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.svoice.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.themecenter.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.timezone.autoupdate_O.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.android.visioncloudagent.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.cmh.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.crane.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.enhanceservice.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.klmsagent.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.knox.securefolder.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.networkui.xml
  remove system/etc/permissions/privapp-permissions-com.samsung.sec.android.application.csc.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.RilServiceModeApp.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.app.SecSetupWizard.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.app.billing.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.app.desktoplauncher.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.app.factorykeystring.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.app.hwmoduletest.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.app.launcher.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.app.magnifier.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.app.myfiles.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.app.ringtoneBR.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.app.safetyassurance.xml
  #remove system/etc/permissions/privapp-permissions-com.sec.android.app.samsungapps.xml #(mabelisle) Folder Missing 2019-02-23
  remove system/etc/permissions/privapp-permissions-com.sec.android.app.servicemodeapp.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.app.soundalive.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.cover.ledcover.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.daemonapp.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.diagmonagent.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.mimage.gear360editor.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.ofviewer.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.omc.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.preloadinstaller.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.provider.badge.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.uibcvirtualsoftkey.xml
  remove system/etc/permissions/privapp-permissions-com.sec.android.widgetapp.samsungapps.xml
  remove system/etc/permissions/privapp-permissions-com.sec.app.RilErrorNotifier.xml
  remove system/etc/permissions/privapp-permissions-com.sec.epdgtestapp.xml
  remove system/etc/permissions/privapp-permissions-com.sec.factory.xml
  remove system/etc/permissions/privapp-permissions-com.sec.hearingadjust.xml
  remove system/etc/permissions/privapp-permissions-com.sec.ims.xml
  remove system/etc/permissions/privapp-permissions-com.sec.imslogger.xml
  remove system/etc/permissions/privapp-permissions-com.sec.imsservice.xml
  remove system/etc/permissions/privapp-permissions-com.sec.location.nsflp2_v3_2.xml
  remove system/etc/permissions/privapp-permissions-com.sec.smartcard.manager.xml
  remove system/etc/permissions/privapp-permissions-com.sec.spp.push.xml
  remove system/etc/permissions/privapp-permissions-com.skms.android.agent.xml
  remove system/etc/permissions/privapp-permissions-com.wsomacp.xml
  remove system/etc/permissions/privapp-permissions-com.wssnps.xml
  remove system/etc/permissions/privapp-permissions-com.wssyncmldm.xml
  remove system/etc/permissions/privapp-permissions-de.axelspringer.yana.zeropage.xml
  remove system/etc/permissions/privapp-permissions-facebook.xml
  remove system/etc/permissions/privapp-permissions-themestore.xml
	# added 20181101
  remove system/etc/permissions/ve_sdk.xml
  remove system/etc/permissions/sec_mdm.xml
  remove system/etc/permissions/secvision.xml
  remove system/etc/permissions/com.samsung.bbc.xml
  remove system/etc/permissions/allshare_library.xml

#============================================================================

  echo "Deleting files in system/etc/sysconfig"
  # virtual reality
  remove system/etc/sysconfig/google_vr_build.xml
  remove system/etc/sysconfig/samsungpushservice.xml
  remove system/etc/sysconfig/samsungpassapp.xml
  remove system/etc/sysconfig/samsungauthframework.xml
  remove system/etc/sysconfig/samsungaccount.xml
  remove system/etc/sysconfig/samsungexperienceservice.xml

#============================================================================

  echo "Deleting files in system/lib and system/lib64"
  remove system/lib/slocation/
  remove system/lib64/slocation/
  if [ ! -e ./mini ]; then
    echo "Deleting files in system/etc/textclassifier"
    remove system/etc/textclassifier/textclassifier.smartselection.ar.model
    remove system/etc/textclassifier/textclassifier.smartselection.de.model
    remove system/etc/textclassifier/textclassifier.smartselection.es.model
    remove system/etc/textclassifier/textclassifier.smartselection.fr.model
    remove system/etc/textclassifier/textclassifier.smartselection.it.model
    remove system/etc/textclassifier/textclassifier.smartselection.ja.model
    remove system/etc/textclassifier/textclassifier.smartselection.ko.model
    remove system/etc/textclassifier/textclassifier.smartselection.pl.model
    remove system/etc/textclassifier/textclassifier.smartselection.pt-PT.model
    remove system/etc/textclassifier/textclassifier.smartselection.ru.model
    remove system/etc/textclassifier/textclassifier.smartselection.th.model
    remove system/etc/textclassifier/textclassifier.smartselection.tr.model
    remove system/etc/textclassifier/textclassifier.smartselection.zh-Hant.model
    remove system/etc/textclassifier/textclassifier.smartselection.zh.model
  fi

#============================================================================

  echo "Deleting directories & files in system/vendor/etc/carrier"
  remove system/vendor/etc/carrier

#============================================================================

  echo "Deleting *verizon* files in system (why the heck are they there in an EU model)"
  find system -name '*verizon*' -exec rm -rf {} \;

#============================================================================

	echo "Patching files in system/etc"
	#these files have 2 root elements in XML which is not allowed
	grep -v 'VERSION value' system/etc/ASKSB.xml > /tmp/ASKSB.xml; cp /tmp/ASKSB.xml system/etc/ASKSB.xml
	grep -v 'VERSION value' system/etc/ASKSC.xml > /tmp/ASKSC.xml; cp /tmp/ASKSC.xml system/etc/ASKSC.xml
	grep -v 'VERSION value' system/etc/ASKSM.xml > /tmp/ASKSM.xml; cp /tmp/ASKSM.xml system/etc/ASKSM.xml
	grep -v 'VERSION value' system/etc/ASKSP.xml > /tmp/ASKSP.xml; cp /tmp/ASKSP.xml system/etc/ASKSP.xml
	grep -v 'VERSION value' system/etc/ASKSP.xml > /tmp/ASKSP.xml; cp /tmp/ASKSP.xml system/etc/ASKSTS.xml
	grep -v 'VERSION value' system/etc/ASKSW.xml > /tmp/ASKSW.xml; cp /tmp/ASKSW.xml system/etc/ASKSW.xml

#============================================================================

	echo "Adding XML headers in system/etc"
	add_xml_header system/etc/mixer_gains.xml
	add_xml_header system/etc/mixer_gains_r00.xml
	add_xml_header system/etc/mixer_paths.xml
	add_xml_header system/etc/mixer_paths_r00.xml
	add_xml_header system/etc/mixer_paths_r01.xml
	add_xml_header system/etc/permissions/com.samsung.android.api.version.xml

#============================================================================

	echo "Deleting files from system/framework"
	find system/framework -name '*KNOX*' -exec rm -rf {} \;
	find system/framework -name '*BIXBY*' -exec rm -rf {} \;
	find system/framework -name '*VISION*' -exec rm -rf {} \;
	find system/framework -name '*SMARTCARD*' -exec rm -rf {} \;
	find system/framework -name '*LAUNCHER*' -exec rm -rf {} \;

#============================================================================

  echo "Deleting files from system/etc/init"
  remove system/etc/init/powersnd.rc
  remove system/etc/init/visiondserver.rc
  remove system/etc/init/uncrypt.rc
  remove system/etc/init/vdc.rc
  remove system/etc/init/bootstat.rc
  remove system/etc/init/wifi-events.rc

  # local dns daemon, no need for that
  remove system/etc/init/mdnsd.rc

#============================================================================

  echo "Remove knox from various xml files"
  grep -v knox system/etc/permissions/platform.xml > /tmp/platform.xml
  cp /tmp/platform.xml system/etc/permissions/
  grep -v knox system/etc/permissions/privapp-permissions-platform.xml > /tmp/privapp-permissions-platform.xml
  cp /tmp/privapp-permissions-platform.xml system/etc/permissions/
  xmlstarlet fo system/etc/sysconfig/framework-sysconfig.xml | grep -v knox > /tmp/framework-sysconfig.xml
  cp /tmp/framework-sysconfig.xml system/etc/sysconfig
  grep -v 'samsung\.account' system/etc/sysconfig/framework-sysconfig.xml > /tmp/framework-sysconfig.xml
  cp /tmp/framework-sysconfig.xml system/etc/sysconfig
  grep -v 'kt\.wifiapi' system/etc/sysconfig/framework-sysconfig.xml > /tmp/framework-sysconfig.xml
  cp /tmp/framework-sysconfig.xml system/etc/sysconfig
  grep -v 'peoplestripe' system/etc/sysconfig/framework-sysconfig.xml > /tmp/framework-sysconfig.xml
  cp /tmp/framework-sysconfig.xml system/etc/sysconfig
  grep -v knox system/vendor/etc/public.libraries.txt > /tmp/public.libraries.txt
  cp /tmp/public.libraries.txt system/vendor/etc/public.libraries.txt
  grep -v 'knox\.' system/vendor/etc/selinux/apm/authorize.xml | grep -v knoxcts > /tmp/authorize.xml
  sed -e 's/knox_/xonk_/g' /tmp/authorize.xml > system/vendor/etc/selinux/apm/authorize.xml

#============================================================================

  echo "Patching system/etc/sysconfig/framework-sysconfig.xml"
  grep -v verizon system/etc/sysconfig/framework-sysconfig.xml > /tmp/framework-sysconfig.xml
  cp /tmp/framework-sysconfig.xml system/etc/sysconfig/framework-sysconfig.xml
	
#============================================================================

  echo "Patching system/etc/sysconfig/google.xml"
  # this will allow gms to be put into battery optimization mode
  grep -v '<allow-in-power-save package="com.google.android.gms" />'  system/etc/sysconfig/google.xml > /tmp/google.xml
  cp /tmp/google.xml system/etc/sysconfig/google.xml
	
#============================================================================

  echo "Deleting files from system/cameradata"
  remove system/cameradata/kidsmode_feature.cl.bin
  remove system/cameradata/ThemeShot/MaskInfo_v3_download.conf
  # delete all of them, we're overwriting using android P fonts later
	
#============================================================================

  echo "Deleting fonts"
  remove system/fonts/
  remove system/etc/fonts.xml

#============================================================================

  echo "Deleting and modifying files in system/media"
  remove system/media/audio/ringtones
  remove system/media/audio/notifications
  #remove system/media/audio/alarms #(mabelisle) Folder Missing 2019-02-23
  tar xf ~/GoogleWiz/androidfiles/sounds/sounds.tar
  remove system/media/audio/ui/Media_preview_Over_the_horizon.ogg*
  remove system/media/audio/ui/Dock.ogg*
  remove system/media/audio/ui/Undock.ogg*
  remove system/media/audio/ui/WirelessChargingStarted.ogg*
  remove system/media/audio/ui/TW_*
  remove system/media/audio/ui/S_Beam_*
  remove system/media/audio/ui/Pen_*
  remove system/media/audio/ui/Bixby_BOS.ogg
  #remove system/media/audio/notifications/S_* #(mabelisle) Already removed 2019-02-23
  #remove system/media/audio/ringtones/A* #(mabelisle) Already removed 2019-02-23
  remove system/media/crypt_bootsamsung*
	
#============================================================================

  if [ ! -e ./leavebinaries ]; then
    echo "Deleting binaries in system/bin and system/xbin"
    remove system/bin/samsungpowersoundplay
    if [ ! -e ./mini ]; then
      remove system/bin/faced
      remove system/bin/irisd
    fi
    remove system/bin/bootchecker
    # remotedisplay is required for video playout
    # rm -rf system/bin/remotedisplay
    #remove system/bin/argosd #(mabelisle) File Missing 2019-02-23
    remove system/bin/edmaudit
    remove system/vendor/bin/at_distributor
    remove system/bin/auditd
    remove system/bin/diagexe
    remove system/bin/apaservice
    remove system/bin/jackservice
    remove system/bin/apexserver
    remove system/bin/vaultkeeperd
    remove system/bin/visiond
    remove system/xbin/jack_*
    remove system/bin/install-recovery.sh
    remove system/bin/uiautomator
    remove system/bin/svc
    remove system/bin/resize2fs
    #rm -rf system/bin/bmgr
    remove system/bin/atrace
    remove system/xbin/cpustats
    remove system/bin/bootstat
    remove system/bin/tombstoned
    #remove system/bin/freeramdisk #(mabelisle) File Missing 2019-02-23
    remove system/bin/mdf_fota
    remove system/bin/wlandutservice
    remove system/bin/tlc_server
    #remove system/xbin/bootchartd #(mabelisle) File Missing 2019-02-23
    remove system/bin/ss_conn_daemon
    remove system/vendor/bin/argosd
    # next one is for a VPN server?
    remove system/bin/racoon
    # next is for wifi calling
    remove system/bin/imsd
    # the next one can also be disabled by ro.wsmd.enable=false
    # this is world shared memory for Samsung pay
    remove system/bin/wsmd
    # not clear what these are used for, but if DR-daemon is stopped, logcat is flooded with following error:
    # SatsServiceData: Failed to connect daemon - java.io.IOException: Connection refused
    ##rm -rf system/vendor/bin/ddexe
    # according to Noxxxious smdex is used for adb
    # SMD-daemon ... disabling it does not seem to do any big harm
    remove system/vendor/bin/smdexe
    remove system/bin/epmlogd
    #remove system/bin/watchdog_break.sh #(mabelisle) File Missing 2019-02-23
    remove system/bin/charon
  fi

  echo "Deleting hyphenation data in system/usr/hyphen-data"
  #just keep en-gb and en-us
  tar cf /tmp/h.tar system/usr/hyphen-data/hyph-en-*
  remove system/usr/hyphen-data/*
  tar xf /tmp/h.tar
  remove /tmp/h.tar
  remove system/usr/hyphen-data/hyph-en-gb.lic.txt
  remove system/usr/hyphen-data/hyph-en-us.lic.txt

#============================================================================

  if [ ! -e ./system/app ]
  then
    echo "Can't find 'system/app' in ROM"
    exit 1
  fi

#============================================================================

  if [ ! -e ./leaveapk ]; then
    echo "Removing bloatware in system/app"
    #remove system/app/Adaway #(mabelisle) File Missing 2019-02-23
    #remove system/app/AppLock #(mabelisle) File Missing 2019-02-23
    #remove system/app/apps_brasil_signed_aligned  #(mabelisle) File Missing 2019-02-23
    remove system/app/AASAservice
    remove system/app/AdvSoundDetector2015
    remove system/app/AllshareFileShare
    remove system/app/AllshareMediaShare
    remove system/app/AntHalService
    remove system/app/ANTPlusPlugins
    remove system/app/ANTPlusTest
    remove system/app/ApexService
    remove system/app/AppLinker
    #remove system/app/AssistedDialingProvider #(mabelisle) File Missing 2019-02-23
    remove system/app/AutomationTest_FB
    remove system/app/BasicDreams
    # knox related
    remove system/app/BBCAgent
    remove system/app/BCService
    remove system/app/BeamService
    remove system/app/BluetoothMidiService
    remove system/app/BluetoothTest
    remove system/app/BookmarkProvider
    remove system/app/bootagent
    #rm -rf system/app/BuiltInPrintService
    remove system/app/CarrierDefaultApp
    remove system/app/CarmodeStub
    remove system/app/ChocoEUKor
    remove system/app/Chrome
    remove system/app/ChromeCustomizations
    remove system/app/ClipboardEdge
    remove system/app/ClockPackage
    #remove system/app/ClockPackage_N #(mabelisle) File Missing 2019-02-23
    #remove system/app/CloudGateway2017 #(mabelisle) File Missing 2019-02-23
    remove system/app/CnnPanel
    remove system/app/CocktailQuickTool
    remove system/app/CompanionDeviceManager
    remove system/app/CoolEUKor
    remove system/app/CoreApps_EOP
    #remove system/app/CoreApps_SDK_2017 #(mabelisle) File Missing 2019-02-23
    remove system/app/CtsShimPrebuilt
    # dual messenger
    remove system/app/DAAgent
    #remove system/app/Daydream_VrOemReceiver #(mabelisle) File Missing 2019-02-23
    remove system/app/DictDiotekForSec
    #remove system/app/DictDiotek_update #(mabelisle) File Missing 2019-02-23
    remove system/app/DownloadableKeystore
    remove system/app/DRParser
    remove system/app/EasterEgg
    remove system/app/EasymodeContactsWidget81
    remove system/app/EasyOneHand3
    remove system/app/EdmSimPinService
    remove system/app/EdmVpnServices
    remove system/app/EmergencyLauncher
    remove system/app/EmergencyModeService
    remove system/app/EmergencyProvider
    #remove system/app/EpdgService #(mabelisle) File Missing 2019-02-23
    remove system/app/ESEServiceAgent
    remove system/app/Facebook_stub
    remove system/app/FactoryCameraFB
    remove system/app/FBAppManager_NS
    remove system/app/FilterInstaller
    #rm -rf system/app/FilterProvider
    #remove system/app/FlashAnnotate #(mabelisle) File Missing 2019-02-23
    remove system/app/FlipboardBriefing
    remove system/app/Foundation
    remove system/app/GameOptimizer
    remove system/app/GearManagerStub
    remove system/app/Gmail2
    remove system/app/GooglePrintRecommendationService
    remove system/app/GoogleTTS
    remove system/app/GoogleVrServices
    remove system/app/HandwritingService
    remove system/app/HiyaService
    #remove system/app/Hs20Provider #(mabelisle) File Missing 2019-02-23
    remove system/app/ImsSettings
    remove system/app/InteractivePanoramaViewer_WQHD
    #remove system/app/KnoxAppsUpdateAgent #(mabelisle) File Missing 2019-02-23
    remove system/app/KnoxAttestationAgent
    #remove system/app/KnoxFolderContainer2 #(mabelisle) File Missing 2019-02-23
    #remove system/app/KnoxRemoteContentsProvider #(mabelisle) File Missing 2019-02-23
    #remove system/app/KnoxSetupWizardClient #(mabelisle) File Missing 2019-02-23
    #remove system/app/KnoxSwitcher #(mabelisle) File Missing 2019-02-23
    remove system/app/LinkSharing_v40
    remove system/app/Maps
    #remove system/app/MhdrService #(mabelisle) File Missing 2019-02-23
    # mobile device management for enterprise
    remove system/app/MDMApp
    remove system/app/MirrorLink
    # mobile ldap
    remove system/app/mldapchecker
    remove system/app/MotionPanoramaViewer
    remove system/app/MSSkype_stub
    #remove system/app/MyGalaxy #(mabelisle) File Missing 2019-02-23
    #remove system/app/My_Singtel* #(mabelisle) File Missing 2019-02-23
    #remove system/app/NaverV_N #(mabelisle) File Missing 2019-02-23
    remove system/app/Omc
    remove system/app/PacProcessor
    #remove system/app/Panorama360Viewer #(mabelisle) File Missing 2019-02-23
    #remove system/app/papergarden #(mabelisle) File Missing 2019-02-23
    remove system/app/PartnerBookmarksProvider
    remove system/app/Personalization
    remove system/app/PhotoTable
    remove system/app/PlayAutoInstallConfig
    #remove system/app/Preconfig #(mabelisle) File Missing 2019-02-23
    remove system/app/RcsSettings
    remove system/app/RootPA
    remove system/app/RoseEUKor
    remove system/app/SafetyInformation
    remove system/app/SamsungCalendar
    #remove system/app/SamsungCalendar_Stable_4012 #(mabelisle) File Missing 2019-02-23
    #remove system/app/SamsungConcierge_stub #(mabelisle) File Missing 2019-02-23
    #remove system/app/SamsungConnect #(mabelisle) File Missing 2019-02-23
    remove system/app/SamsungConnect_Stub
    # data loss prevention from Sammy
    remove system/app/SamsungDLPService
    #remove system/app/SamsungExperienceService #(mabelisle) File Missing 2019-02-23
    remove system/app/SamsungIMEv3.0
    #remove system/app/SamsungIMEv5 #(mabelisle) File Missing 2019-02-23
    #remove system/app/SamsungIMEv6 #(mabelisle) File Missing 2019-02-23
    remove system/app/SamsungPassAutofill_v1
    remove system/app/SamsungTTS
    remove system/app/SapaAudioConnectionService
    remove system/app/SapaMonitor
    remove system/app/SBrowserEdge
    remove system/app/SCPMClient_N
    #remove system/app/ScrollCapture #(mabelisle) File Missing 2019-02-23
    remove system/app/SecFactoryPhoneTest
    remove system/app/SecHTMLViewer
    remove system/app/SecureFolderSetupPage
    # know related log
    remove system/app/SecurityLogAgent
    remove system/app/SecurityProviderSEC
    remove system/app/SelfMotionPanoramaViewer
    #remove system/app/ShareLink_2017 #(mabelisle) File Missing 2019-02-23
    remove system/app/SilentLog
    remove system/app/SLocation
    #remove system/app/SlowMotion_Dream_N #(mabelisle) File Missing 2019-02-23
    remove system/app/SlowMotion_Star_N
    #remove system/app/SmartCallProvider #(mabelisle) File Missing 2019-02-23
    remove system/app/SmartCapture
    remove system/app/SmartcardService
    #remove system/app/SmartClipEdgeService #(mabelisle) File Missing 2019-02-23
    remove system/app/SmartFittingService
    remove system/app/SmartMirroring
    remove system/app/SmartReminder
    remove system/app/SmartSwitchAgent
    #remove system/app/SnsImageCache_N #(mabelisle) File Missing 2019-02-23
    remove system/app/SPdfNote
    remove system/app/SplitSoundService
    #rm -rf system/app/SPrintSpooler
    #remove system/app/SPrintSpooler7 #(mabelisle) File Missing 2019-02-23
    remove system/app/STalkback
    remove system/app/StoryEditor_Dream_N
    remove system/app/sveservice
    # root detection from Sammy
    remove system/app/SysScope
    #remove system/app/TasksProvider #(mabelisle) File Missing 2019-02-23
    remove system/app/TetheringAutomation
    #remove system/app/TFunLock #(mabelisle) File Missing 2019-02-23
    # Trustonic see https://www.tuicool.com/articles/miq2ay
    remove system/app/TuiService
    #remove system/app/ubank_samsung #(mabelisle) File Missing 2019-02-23
    remove system/app/UniversalMDMClient
    remove system/app/UniversalSwitch
    remove system/app/UPSMTheme
    #remove system/app/UserManual #(mabelisle) File Missing 2019-02-23
    remove system/app/USBSettings
    remove system/app/VideoEditorLite_Dream_N
    #remove system/app/VideoTrimmer_Dream #(mabelisle) File Missing 2019-02-23
    remove system/app/VideoTrimmer_SEP90
    #remove system/app/VirtualTour_N_OS #(mabelisle) File Missing 2019-02-23
    remove system/app/VisionIntelligence
    # virtual sim service
    remove system/app/vsimservice
    remove system/app/WallpaperBackup
    remove system/app/Weather_*
    #remove system/app/Weather2017 #(mabelisle) File Missing 2019-02-23
    #remove system/app/WeatherWidget2017 #(mabelisle) File Missing 2019-02-23
    remove system/app/WebManual
    remove system/app/WebViewGoogle
    #remove system/app/WfdBroker #(mabelisle) File Missing 2019-02-23
    remove system/app/withTV
    remove system/app/WlanTest
    remove system/app/YahooEdgeFinance
    remove system/app/YahooEdgeSports
    #remove system/app/yandex* #(mabelisle) File Missing 2019-02-23
    remove system/app/YouTube
    if [ ! -e ./mini ]; then
      remove system/app/SimSettingMgr
      remove system/app/Stk
      remove system/app/Stk2
    fi
  fi

#============================================================================

  if [ ! -e ./system/priv-app ]
  then
    echo "Can't find 'system/priv-app' in ROM"
    exit 1
  fi

#============================================================================

  if [ ! -e ./leaveapk ]; then
    echo "Removing bloatware in system/priv-app"
    remove system/priv-app/imsservice
    remove system/priv-app/AccessControl_N
    remove system/priv-app/ANTRadioService
    remove system/priv-app/AppsEdgePanel*
    remove system/priv-app/AssistantMenu_N
    remove system/priv-app/AuthFramework
    #remove system/priv-app/AuthService_v2 #(mabelisle) File Missing 2019-02-23
    #remove system/priv-app/AutomationTest_FB #(mabelisle) File Missing 2019-02-23
    remove system/priv-app/AutoPreconfig
    # next one is needed for Google Backup
    #rm -rf system/priv-app/BackupRestoreConfirmation
    remove system/priv-app/BadgeProvider_N
    remove system/priv-app/BeaconManager
    remove system/priv-app/Bixby*
    # next one is needed for Google Backup
    #rm -rf system/priv-app/CallLogBackup
    remove system/priv-app/CarrierConfig
    #needed for camera 7.6.76
    #rm -rf system/priv-app/CMHProvider
    remove system/priv-app/CocktailBarService*
    remove system/priv-app/ColorAdjustment
    #remove system/priv-app/ColorBlind_N #(mabelisle) File Missing 2019-02-23
    remove system/priv-app/ConfigUpdater
    remove system/priv-app/ContainerAgent3
    remove system/priv-app/ContextProvider
    remove system/priv-app/Crane
    remove system/priv-app/CSC
    remove system/priv-app/CtsShimPrivPrebuilt
    #remove system/priv-app/Daydream_VrCore #(mabelisle) File Missing 2019-02-23
    #remove system/priv-app/DayLite #(mabelisle) File Missing 2019-02-23
    remove system/priv-app/DCMService
    remove system/priv-app/DesktopModeUiService
    #remove system/priv-app/DeviceHealthReporter #(mabelisle) File Missing 2019-02-23
    remove system/priv-app/DeviceKeystring
    remove system/priv-app/DeviceQualityAgent
    remove system/priv-app/DeviceTest
    remove system/priv-app/DiagMonAgent
    remove system/priv-app/EasySetup
    remove system/priv-app/EmergencyInfo
    remove system/priv-app/EnhanceService
    remove system/priv-app/EpdgService
    remove system/priv-app/Excel_SamsungStub
    remove system/priv-app/ExternalStorageProvider
    remove system/priv-app/FBInstaller_NS
    remove system/priv-app/FBServices
    remove system/priv-app/Finder_*
    remove system/priv-app/Fmm
    remove system/priv-app/FotaAgent
    #remove system/priv-app/Fresco_1.0 #(mabelisle) File Missing 2019-02-23
    remove system/priv-app/GalaxyApps*
    remove system/priv-app/GalaxyAppsWidget_Phone_Dream
    remove system/priv-app/GameHome*
    remove system/priv-app/GameTools_Dream
    remove system/priv-app/Gear360*
    remove system/priv-app/GmsCore
    # next one is needed for Google Backup
    #rm -rf system/priv-app/GoogleBackupTransport
    remove system/priv-app/GoogleDaydreamCustomization
    remove system/priv-app/GoogleFeedback
    remove system/priv-app/GooglePartnerSetup
    #remove system/priv-app/Hearingdro_V6 #(mabelisle) File Missing 2019-02-23
    remove system/priv-app/Hearingdro_V7
    if [ ! -e ./mini ]; then
      remove system/priv-app/Hotword*
    fi
    remove system/priv-app/HwModuleTest
    #remove system/priv-app/Ignite* #(mabelisle) File Missing 2019-02-23
    remove system/priv-app/ImsLogger*
    remove system/priv-app/ImsTelephonyService
    remove system/priv-app/InputDevices
    #remove system/priv-app/intelligenceservice2 #(mabelisle) File Missing 2019-02-23
    remove system/priv-app/IPService
    remove system/priv-app/IrisUserTest
    remove system/priv-app/KeyguardWallpaperUpdator
    # enterprise solution
    remove system/priv-app/KLMSAgent
    remove system/priv-app/Knox*
    remove system/priv-app/knox*
    remove system/priv-app/LedCoverAppDream
    remove system/priv-app/LedCoverService
    #remove system/priv-app/LTETest #(mabelisle) File Missing 2019-02-23
    remove system/priv-app/ManagedProvisioning
    remove system/priv-app/MateAgent
    remove system/priv-app/MediaLearning*
    remove system/priv-app/Messaging_SEP81
    remove system/priv-app/ModemServiceMode
    remove system/priv-app/NetworkDiagnostic
    #remove system/priv-app/NSFusedLocation_v3.0_DREAM #(mabelisle) File Missing 2019-02-23
    remove system/priv-app/NSFusedLocation_v3.2/
    #remove system/priv-app/ODTCFactoryService #(mabelisle) File Missing 2019-02-23
    remove system/priv-app/OmaCP
    remove system/priv-app/OMCAgent*
    remove system/priv-app/OneDrive_Samsung_v2
    remove system/priv-app/PaymentFramework
    remove system/priv-app/PeopleStripe
    remove system/priv-app/PhoneErrService
    remove system/priv-app/Phonesky
    remove system/priv-app/PhotoStudio_WQHD_Star
    remove system/priv-app/PowerPoint_SamsungStub
    remove system/priv-app/PreloadInstaller
    remove system/priv-app/ProxyHandler
    #remove system/priv-app/RadioBasedLocation #(mabelisle) File Missing 2019-02-23
    #remove system/priv-app/RadioBasedLocationManager #(mabelisle) File Missing 2019-02-23
    remove system/priv-app/ringtoneBR
    remove system/priv-app/Rlc
    # virtual reality
    remove system/priv-app/RNB
    # virtual reality
    #remove system/priv-app/RNBShell #(mabelisle) File Missing 2019-02-23
    remove system/priv-app/Rubin*
    remove system/priv-app/SamsungAccount*
    remove system/priv-app/SamsungBilling
    remove system/priv-app/SamsungCalendarProvider
    remove system/priv-app/SamsungCloud*
    remove system/priv-app/SamsungContacts
    #remove system/priv-app/SamsungContactsStable #(mabelisle) File Missing 2019-02-23
    #remove system/priv-app/SamsungContacts90UPG #(mabelisle) Modified name 2019-02-23
    remove system/priv-app/SamsungExperienceService
    remove system/priv-app/SamsungInCallUI
    remove system/priv-app/SamsungMagnifier3
    remove system/priv-app/SamsungMultiWindow
    remove system/priv-app/SamsungPass*
    remove system/priv-app/SamsungPositioning
    remove system/priv-app/SamsungVideoPlayer2016
    #remove system/priv-app/ScreenRecorder #(mabelisle) File Missing 2019-02-23
    remove system/priv-app/SecGallery2015
    remove system/priv-app/SecLiveWallpapersPicker
    remove system/priv-app/SecMyFiles2017
    remove system/priv-app/SecSetupWizard_Global
    remove system/priv-app/SecureFolder
    remove system/priv-app/SelectiveFocusViewer
    remove system/priv-app/SEMFactoryApp
    remove system/priv-app/SendHelpMessage
    remove system/priv-app/serviceModeApp_FB
    # next one removed on July 14
    remove system/priv-app/SettingsReceiver
    # next one is needed for Google backup
    #rm -rf system/priv-app/SharedStorageBackup
    if [ ! -e ./mini ]; then
      remove system/priv-app/SimSettingMgr
    fi
    remove system/priv-app/SKMSAgent
    remove system/priv-app/SmartCallProvider
    remove system/priv-app/SmartcardManager
    remove system/priv-app/SmartEpdgTestApp
    remove system/priv-app/smartfaceservice
    remove system/priv-app/SamsungThemes_v4
    remove system/priv-app/ThemeCenter
    remove system/priv-app/SmartManager_v5 #(mabelisle) Modified name 2019-02-23
    remove system/priv-app/SmartManager_v6_DeviceSecurity
    remove system/priv-app/SMusicPicker
    #remove system/priv-app/SNS_v2_N #(mabelisle) File Missing 2019-02-23
    remove system/priv-app/SOAgent
    remove system/priv-app/SoundAlive_52
    # security policy data client
    remove system/priv-app/SPDClient
    remove system/priv-app/SPPPushClient*
    remove system/priv-app/StatementService
    #StickerProvider is required for camera 7.6.76
    remove system/priv-app/StickerCenter
    remove system/priv-app/StickerFaceAR
    remove system/priv-app/StickerStamp
    remove system/priv-app/StorageManager
    remove system/priv-app/StoryService
    remove system/priv-app/StubUpdater
    remove system/priv-app/SVCAgent
    remove system/priv-app/SVoicePLM
    remove system/priv-app/SystemUIBixby/
    remove system/priv-app/Tag
    remove system/priv-app/TaskEdgePanel*
    remove system/priv-app/TimeZoneUpdater/
    remove system/priv-app/TouchWizHome_2017
    #remove system/priv-app/TransmitPowerService #(mabelisle) File Missing 2019-02-23
    #remove system/priv-app/TzDataUpdater #(mabelisle) File Missing 2019-02-23
    # floating button?
    remove system/priv-app/UIBCVirtualSoftkey
    #remove system/priv-app/UnifiedProfile #(mabelisle) File Missing 2019-02-23
    remove system/priv-app/Upday
    remove system/priv-app/Velvet
    remove system/priv-app/Vision*
    remove system/priv-app/VoiceServiceFramework
    remove system/priv-app/VoiceWakeUp
    #remove system/priv-app/VoWifiSPG #(mabelisle) File Missing 2019-02-23
    #remove system/priv-app/VRSetupWizardStub #(mabelisle) File Missing 2019-02-23
    remove system/priv-app/WallpaperCropper
    remove system/priv-app/wallpaper-res
    remove system/priv-app/Word_SamsungStub
    remove system/priv-app/wssyncmlnps2
    remove system/priv-app/MtpDocumentsProvider
  fi

#============================================================================

  if [ ! "$1" == "onlyapk" ]; then
    # remove VR stuff (june 27)
    echo "Removing VR files"
    remove system/bin/vr
    remove system/etc/permissions/android.hardware.vr.high_performance.xml
    remove system/framework/oat/arm/vr.odex
    remove system/framework/oat/arm/vr.vdex
    remove system/framework/oat/arm64/vr.odex
    remove system/framework/oat/arm64/vr.vdex
    remove system/framework/vr.jar
    remove system/vendor/bin/hw/android.hardware.vr@1.0-service
    remove system/vendor/etc/init/android.hardware.vr@1.0-service.rc
  fi

#============================================================================

  if [ -e ./mini ]; then
    echo "Installing Google base to system/app and system/priv-app"
    cp -r ~/GoogleWiz-Apps/apps/system ~/GoogleWiz
    #tar xf ~/GoogleWiz/androidfiles/apps.tar #(mabelisle) Move apps to repo 2019-02-26
    #remove system/priv-app/MyFileManager #(mabelisle) File Missing 2019-02-23
    #remove system/priv-app/MyLauncherKey #(mabelisle) File Missing 2019-02-23
    #remove system/priv-app/MySystemInfo #(mabelisle) File Missing 2019-02-23
    #remove system/priv-app/MyCalendarWidget #(mabelisle) File Missing 2019-02-23
  fi
  #remove system/priv-app/MyMail #(mabelisle) File Missing 2019-02-23
  #remove system/priv-app/MyMailKey #(mabelisle) File Missing 2019-02-23

#============================================================================

  if [ ! -e ./system/etc ]
  then
    echo "Can't find 'system/etc' in ROM"
    exit 1
  fi

#============================================================================

  if [ ! "$1" == "onlyapk" ]; then
    echo "Creating init.d and scripts"
    mkdir -p system/etc/init.d/
    cp ~/GoogleWiz/androidfiles/init.d/LS00* system/etc/init.d/
    if [ -e ./mini ]; then
        rm system/etc/init.d/LS00dvfs
    fi
    echo "Creating services.d and scripts"
    mkdir -p system/etc/services.d/
    cp ~/GoogleWiz/androidfiles/services.d/LS99* system/etc/services.d/
    if [ -e ./mini ]; then
        rm system/etc/services.d/LS99humo
    fi
    echo "Creating system/csc"
    # remove system/csc/ #(mabelisle) Folder Missing 2019-02-23
    mkdir system/csc/
    cp ~/GoogleWiz/androidfiles/feature/customer.xml system/csc/
    echo "Setting system/csc/sales_code.dat to PRO"
    echo PRO > system/csc/sales_code.dat
    echo "Adding script to /etc/init"
    cp ~/GoogleWiz/androidfiles/init/zzzfoobar66.rc system/etc/init/
  fi

#============================================================================

  if [ ! -e ./system/xbin ]
  then
    echo "Can't find 'system/xbin' in ROM"
    exit 1
  fi

#============================================================================

  echo "Copying permissions"
  if [ ! "$1" == "onlyapk" ]; then
    cp ~/GoogleWiz/androidfiles/permissions/privapp-permissions-platform.xml system/etc/permissions/
    cp ~/GoogleWiz/androidfiles/permissions/privapp-permissions-google.xml system/etc/permissions/
    cp ~/GoogleWiz/androidfiles/gps/gps.conf system/etc/
  fi

#============================================================================

  echo "Copying Google dialer files"
  cp ~/GoogleWiz/androidfiles/dialer/com.google.android.dialer.support.jar system/framework/
  cp ~/GoogleWiz/androidfiles/dialer/com.google.android.dialer.support.xml system/etc/permissions/
  cp ~/GoogleWiz/androidfiles/dialer/dialer_experience.xml system/etc/sysconfig/
  cp ~/GoogleWiz/androidfiles/pixel/pixel_experience_2017.xml system/etc/sysconfig/
  cp ~/GoogleWiz/androidfiles/pixel/pixel_experience_2018.xml system/etc/sysconfig/

#============================================================================

  echo "Copying executables"
  cp ~/GoogleWiz/androidfiles/bin/* system/xbin

#============================================================================

  echo "Copying hosts file"
  cp ~/GoogleWiz/androidfiles/hosts/hosts.short system/etc
  cp ~/GoogleWiz/androidfiles/hosts/hosts.long system/etc
  cp ~/GoogleWiz/androidfiles/hosts/hosts.medium system/etc

#============================================================================

  echo "Copying libraries"
  cp ~/GoogleWiz/androidfiles/lib/libblurdetection.so system/lib

#============================================================================

  # this tricks the device into being a Pixel but has impact on photos app
  tar xf ~/GoogleWiz/androidfiles/pixel/PixelEtc.tar
  cp ~/GoogleWiz/androidfiles/pixel/pixel_2018_exclusive.xml system/etc/sysconfig/
  cp ~/GoogleWiz/androidfiles/pixel/google-hiddenapi-package-whitelist.xml system/etc/sysconfig/
  cp ~/GoogleWiz/androidfiles/pixel/hiddenapi-package-whitelist.xml system/etc/sysconfig/

#============================================================================

  if [ ! "$1" == "onlyapk" ]; then
    cp ~/GoogleWiz/androidfiles/apns-conf.xml system/etc/
    cp ~/GoogleWiz/androidfiles/feature/feature.xml system/csc/
    cp ~/GoogleWiz/androidfiles/feature/camera-feature-v7.xml system/cameradata/
    cp ~/GoogleWiz/androidfiles/feature/camera-feature-v8.xml system/cameradata/
    cp ~/GoogleWiz/androidfiles/feature/floating_feature.xml system/etc/floating_feature.xml
    cp ~/GoogleWiz/androidfiles/media/media_profiles.xml system/etc/
    # overlays
    tar xf ~/GoogleWiz/androidfiles/overlays/overlays.tar
    if [ -e ./mini ]; then
      # no round icons for GoogleWiz variants
      remove system/vendor/overlay/RoundIconsMaskOverlay.apk
    fi
  fi

#============================================================================

  chmod +x system/xbin/*

#============================================================================

  echo "Installing boot animation"
  cp ~/GoogleWiz/androidfiles/bootanimation/*.qmg system/media

  mkdir -p system/etc/bash
  cp ~/GoogleWiz/androidfiles/bash/bashrc system/etc/bash/
  cp ~/GoogleWiz/androidfiles/bash/bash_aliases system/etc/bash/
  cp ~/GoogleWiz/androidfiles/bash/mkshrc system/etc

#============================================================================

  echo "Installing android P fonts"
  if [ -e ./mini ]; then
    tar xf ~/GoogleWiz/androidfiles/fonts/AndroidPFontsLarge.tar 2> /dev/null
  else
    tar xf ~/GoogleWiz/androidfiles/fonts/AndroidPFonts.tar 2> /dev/null
  fi
  tar xf ~/GoogleWiz/androidfiles/fonts/AODfonts.tar 2> /dev/null
  cp ~/GoogleWiz/androidfiles/fonts/fonts.xml system/etc/

#============================================================================

  # generate symlinks for updated file
  echo "Generating SYMLINKS file"
  find system -type l -exec ls -Foh {} \; | sort | awk '{print "symlink(\"" $10 "\", \"" $8 "\");"}' | sed 's/\*//g' | sed 's/"system/"\/system/g' > SYMLINKS
  # remove symlinks
  echo "Removing symlinks in system"
  find system -type l -exec rm {} \;

#============================================================================

  if [ ! -e ./noprop ]; then
    # patch build.prop
    echo "Patching build.prop (changing properties)"
    cp system/build.prop system/build.prop.orig
    grep -v 'ro.build.display.id' system/build.prop > /tmp/build.prop.tmp
    cp /tmp/build.prop.tmp system/build.prop
    # note: originally had set ro.config.knox=0 ... but then copy/paste did no longer work!
    # have to keep it set at ro.config.knox=v30 ...
    declare -a props=(
      's/ro.build.selinux=1/ro.build.selinux=0/g'
      's/persist.sys.storage_preload=1/persist.sys.storage_preload=0/g'
      's/ro.config.tima=1/ro.config.tima=0/g'
      's/ro.product.locale=en-GB/ro.product.locale=en_US/g'
      's/ro.config.dmverity=true/ro.config.dmverity=false/g'
      's/ro.config.knox=v30/ro.config.knox=v30/g'
      's/ro.config.timaversion=3.0/ro.config.timaversion=disabled/g'
      's/ro.config.ringtone=Over_the_Horizon.ogg/ro.config.ringtone=Beats.ogg/g'
      's/ro.config.notification_sound=Skyline.ogg/ro.config.notification_sound=Beep.ogg/g'
      's/ro.config.alarm_alert=Morning_Glory.ogg/ro.config.alarm_alert=Awaken.ogg/g' 
      's/ro.config.ringtone_2=Basic_Bell.ogg/ro.config.ringtone_2=Beats.ogg/g'
      's/ro.config.notification_sound_2=S_Charming_Bell.ogg/ro.config.notification_sound_2=Beep.ogg/g'
      's/ro.config.rm_preload_enabled=1/ro.config.rm_preload_enabled=0/g'
      's/ro.ril.gprsclass=10/ro.ril.gprsclass=12/g'
      's/ro.ril.hsxpa=1/ro.ril.hsxpa=3/g'
      's/ro.security.mdf.ux=Enabled/ro.security.mdf.ux=Disabled/g'
      's/ro.security.vaultkeeper.feature=1/ro.security.vaultkeeper.feature=0/g'
      's/net.dns1=8.8.8.8/net.dns1=1.1.1.1/g'
      's/net.dns2=8.8.4.4/net.dns2=1.0.0.1/g'
      's/ro.config.kap_default_on=true/ro.config.kap_default_on=false/g'
      's/ro.config.kap=true/ro.config.kap=false/g'
      's/ro.config.rkp=true/ro.config.rkp=false/g'
    )
    for i in ${props[@]}; do
      cat system/build.prop | sed $i > /tmp/build.prop.tmp
      cp /tmp/build.prop.tmp system/build.prop
    done
    echo "Patching build.prop (removing properties)"
    declare -a props=(
      ro.security.mdf.ver
      ro.security.wlan.ver
      ro.security.wlan.release
      ro.security.mdf.release
      ro.security.fips.ux
      ro.security.fips_bssl.ver
      ro.security.fips_skc.ver
      ro.security.fips_scrypto.ver
      ro.security.fips_fmp.ver
      security.ASKS.policy_version
      ro.com.google.clientidbase
      net.dns1
      net.dns2
    )
    for i in ${props[@]}; do
      cat system/build.prop | grep -v $i > /tmp/build.prop.tmp
      cp /tmp/build.prop.tmp system/build.prop
    done
    echo "Patching build.prop (adding properties)"
    cat /tmp/build.prop.tmp ~/GoogleWiz/androidfiles/extrabuild > system/build.prop
  fi
  echo 'ro.csc.sales_code=PRO' >> system/build.prop
  echo "ro.build.display.id=GoogleWiz Oreo built by mabelisle (`date +%Y-%m-%d`)" >> system/build.prop
  #echo "Copying build.prop to ~/GoogleWiz"
  #cp system/build.prop ~/GoogleWiz

#============================================================================

  if [ ! "$1" == "onlyapk" ]; then
    echo "Adding aptx bluetooth streaming"
    tar xf ~/GoogleWiz/androidfiles/aptx/aptx.tar -C system
  fi

#============================================================================

  if [ ! "$1" == "onlyapk" ]; then
    # rename all .apk files as 'base.apk'
    #remove dexopt  #(mabelisle) Folder Missing 2019-02-23
    echo "Renaming apk files in system/app"
    APKF=`find system/app -name '*.apk' | grep -v 'base.apk' | grep -v 'split_config'`
    for APK in $APKF ; do
      BN=`basename $APK`
      SN=`echo $BN | sed -e 's/\.apk//g'`
      DN=`dirname $APK`
      if [ ! -d $DN/oat ] ; then
        mv $APK $DN/base.apk
      fi
    done
    echo "Renaming apk files in system/priv-app"
    APKF=`find system/priv-app -name '*.apk' | grep -v 'base.apk' | grep -v 'split_config' `
    for APK in $APKF ; do
      BN=`basename $APK`
      SN=`echo $BN | sed -e 's/\.apk//g'`
      DN=`dirname $APK`
      if [ ! -d $DN/oat ] ; then
        mv $APK $DN/base.apk
      fi
    done
    
    if [ ! -e ./noreplace ]
    then
      echo "Replacing Samsung APKs with newer versions"
      find ../GoogleWiz-Apps/sapps/system/app/* system/app/* -maxdepth 0 -type d | awk -F/ '{D[$NF]++} END {for (d in D) if (D[d]>1) print "rm -rf system/app/" d}' | sh
      find ../GoogleWiz-Apps/sapps/system/priv-app/* system/priv-app/* -maxdepth 0 -type d | awk -F/ '{D[$NF]++} END {for (d in D) if (D[d]>1) print "rm -rf system/priv-app/" d}' | sh

      #for file in `tar tvf ~/GoogleWiz/androidfiles/sapps.tar  | awk '{print $6}' | sed 's#/# #g' | awk '{print $3'} | sort | uniq`; do
      #  rm -rf system/app/$file
      #  rm -rf system/priv-app/$file
      #done
    cp -r ~/GoogleWiz-Apps/sapps/system ~/GoogleWiz
		#tar xf ~/GoogleWiz/androidfiles/sapps.tar
    fi
  fi

#============================================================================

  echo "Removing *.orig files from system/app and system/priv-app"
  find system/app -name '*.orig' -exec rm -rf {} \; 2> /dev/null
  find system/priv-app -name '*.orig' -exec rm -rf {} \; 2> /dev/null

#============================================================================

  if [ ! "$1" == "onlyapk" ]
  then
    echo "Optimizing XML files in system"
    # remove comments from XMLs
    for i in `find system -name '*.xml'`
    do
      xmlstarlet ed -d '//comment()' $i > /tmp/foo.xml
      cp /tmp/foo.xml $i
    done
    # remove whitespace from XMLs
    for i in `find system -name '*.xml'`
    do
      cat $i | sed -e '/^[ \t]*$/d;s,^[ \t]*,,;s,>[ \t]*<,><,g;s,[ \t]*$,,' > /tmp/foo.xml
      cp /tmp/foo.xml $i
    done
    # validate XMLs
    echo "Validating XML files in system"
    find system -name '*.xml' -exec xmlstarlet val -e {} \; | grep invalid
  fi

#============================================================================

  if [ ! "$1" == "onlyapk" ]; then
    if [ ! -e ./mini ]; then
      echo "Checking knox references"
      ftsc knox | grep -v wisemo | grep -v Binar | grep -v build.prop | grep -v nonplat_mac_permissions.xml
    fi
  fi

#============================================================================

  echo "Applying Netflix fix"
  mv system/lib/liboemcrypto.so system/lib/liboemcrypto.so.bak

#============================================================================

  #echo "Removing oat files for Magisk" #(mabelisle) Folder Missing 2019-02-24
  #remove system/priv-app/MyMagisk/oat #(mabelisle) Folder Missing 2019-02-24

#============================================================================

  echo "Copying noxxx system files"
  cp -r ~/GoogleWiz/androidfiles/noxsystem/* system

#============================================================================

  if [ ! -e ./mini ]; then
    cp system/etc/hosts.medium system/etc/hosts
  fi

#============================================================================

  # remove empty directories (twice)
  echo "Removing empty directories"
  find . -type d -empty -exec rm -rf {} \; 2>/dev/null
  find . -type d -empty -exec rm -rf {} \; 2>/dev/null
}

#######################################################
# remove() Deleting directories & files with validation
# Globals:
#   None
# Arguments:
#   (String) File name, (String) Line number
# Returns:
#   None
#######################################################
function remove()
{
  if [ -e $1 ]; then
    rm -rf $1;
  else
    err "Error removing -> "\"$1\";
  fi
}

#######################################################
# err() Display error message with a timestamp
# Globals:
#   None
# Arguments:
#   (String) Error message
# Returns:
#   None
#######################################################
function err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@";
}

#######################################################
# add_xml_header() Add an xml header
# Globals:
#   None
# Arguments:
#   (String) Filename, (String) Line number
# Returns:
#   None
#######################################################
function add_xml_header () {
	if [ -f "$1" ]
	then
		(echo '<?xml version="1.0" encoding="utf-8"?>'; cat "$1") > /tmp/foo.xml
		cp /tmp/foo.xml $1
	else
		err "Error adding XML header on -> "\"$1\";
	fi
}

# Call main function
main "$@"; exit
