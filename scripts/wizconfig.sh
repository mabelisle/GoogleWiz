#!/sbin/sh

BB=/sbin/busybox
D2U=/sbin/dos2unix

CF=/sdcard/googlewiz.config
LOGFILE=/data/wizconfig.log

# Defaults
LAUNCHER=false
KEYBOARD=false
BLACKNAVBAR=false
GOOGLECHROMECAST=false
BIXNEW='key 703 HOME'

# Main execution
main()
{
  $BB rm -rf $LOGFILE
  $BB echo ">> wizconfig.sh script (start)" | $BB tee -a $LOGFILE

  if [ -f "$CF" ]; then
    $BB echo "-- $CF found, converting to UNIX format" | $BB tee -a $LOGFILE
    $D2U $CF
    
    # parse the config file and delete what we don't need (assuming /system is still mounted)
    while IFS='' read -r line || [[ -n "$line" ]]; do
      $BB echo "-- processing line: $line" | $BB tee -a $LOGFILE
      
      case $line in
      
        # Clock https://play.google.com/store/apps/details?id=com.google.android.deskclock&hl=en
        clock=0)
          remove /system/priv-app/googlewiz.com.google.android.deskclock;;
            
        # Google Calendar https://play.google.com/store/apps/details?id=com.google.android.calendar
        calendar=0)
          remove /system/priv-app/googlewiz.com.google.android.calendar;;

        # MiXplorer https://forum.xda-developers.com/showthread.php?t=1523691
        mixplorer=0)
          remove /system/priv-app/googlewiz.com.mixplorer.silver;;

        # Google App https://play.google.com/store/apps/details?id=com.google.android.googlequicksearchbox
        search=0)
          remove /system/priv-app/googlewiz.com.google.android.googlequicksearchbox;;

        # Google Assistant https://play.google.com/store/apps/details?id=com.google.android.apps.googleassistant
        assistant=0)
          remove /system/priv-app/googlewiz.com.google.android.apps.googleassistant;;

        # Cloud Print https://play.google.com/store/apps/details?id=com.google.android.apps.cloudprint
        print=0)
          remove /system/priv-app/googlewiz.com.google.android.apps.cloudprint
          remove /system/app/SPrintSpooler
          remove /system/app/BuiltInPrintService;;

        # Calculator https://play.google.com/store/apps/details?id=com.google.android.calculator
        calculator=0)
          remove /system/priv-app/googlewiz.com.google.android.calculator;;

        # MTP "Enable transfer between PC and mobile phone"
        mtp=0)
          remove /system/priv-app/MtpApplication
          remove /system/etc/init/mtpd.rc
          remove /system/bin/mtpd;;

        # Samsung Blue Light Filter
        bluelightfilter=0)
          remove /system/priv-app/BlueLightFilter;;
        
        # Samsung Smart Manager
        smartmanager=0)
          remove /system/priv-app/SmartManager_v5;;

        # Nova Launcher https://play.google.com/store/apps/details?id=com.teslacoilsw.launcher
        launcher=nova)
          remove /system/priv-app/googleziz.amirz.rootless.nexuslauncher
          remove /system/priv-app/googlewiz.com.google.android.apps.nexuslauncher
          LAUNCHER=true;;

        # Rootless Pixel Launcher https://github.com/amirzaidi/Launcher3
        launcher=pixel)
          remove /system/priv-app/googlewiz.com.teslacoilsw.launcher
          remove /system/priv-app/googlewiz.com.teslacoilsw.launcherclientproxy
          LAUNCHER=true;;

        # Gboard - the Google Keyboard https://play.google.com/store/apps/details?id=com.google.android.inputmethod.latin
        keyboard=gboard)
          remove /system/app/googlewiz.com.touchtype.swiftkey
          KEYBOARD=true;;

        # SwiftKey Keyboard https://play.google.com/store/apps/details?id=com.touchtype.swiftkey
        keyboard=swiftkey)
          remove /system/app/com.google.android.inputmethod.latin
          KEYBOARD=true;;

        # AdAway https://forum.xda-developers.com/showthread.php?t=2190753
        adaway=0)
          remove /system/priv-app/googlewiz.org.adaway;;

        # Google News https://play.google.com/store/apps/details?id=com.google.android.apps.magazines
        news=0)
          remove /system/priv-app/googlewiz.com.google.android.apps.magazines;;

        # Black Navigation Bar
        blacknavbar=1)
          BLACKNAVBAR=true;;

        # Google Home https://play.google.com/store/apps/details?id=com.google.android.apps.chromecast.app
        chromecast=1)
          GOOGLECHROMECAST=true;;

        # Samsung Camera
        camera=0)
          remove system/priv-app/SamsungCamera7;;

        # Google Photos https://play.google.com/store/apps/details?id=com.google.android.apps.photos
        photos=0)
          remove system/priv-app/googlewiz.com.google.android.apps.photos;;

        # Smasung Icons (Removing pixel icons)
        icons=samsung)
          remove /system/vendor/overlay/SettigsIcons.apk
          remove /system/vendor/overlay/SystemuiStatusbarIcons.apk
          remove /system/vendor/overlay/SystemuiTilesIcons.apk
          remove /system/vendor/overlay/SystemuiNavbarAOSP.apk;;

        # MMS Services
        mms=0)
          remove system/priv-app/MsgCommService
          remove system/priv-app/MmsService;;

        # Gmail https://play.google.com/store/apps/details?id=com.google.android.gm
        gmail=0)
          remove /system/priv-app/MyGoogleGmail;;

        # Google Drive https://play.google.com/store/apps/details?id=com.google.android.apps.docs
        drive=0)
          remove /system/priv-app/MyGoogleDrive;;

        # Maps - Navigate & Explore https://play.google.com/store/apps/details?id=com.google.android.apps.maps
        maps=0)
          remove /system/priv-app/googlewiz.com.google.android.apps.maps;;

        # Google Chrome: Fast & Secure https://play.google.com/store/apps/details?id=com.android.chrome
        chrome=0)
          remove /system/priv-app/googlewiz.com.android.chrome;;
        chrome=1)
          remove /system/app/googlewiz.com.google.android.webview;;
          
        # Youtube https://play.google.com/store/apps/details?id=com.google.android.youtube
        youtube=0)
          remove /system/priv-app/googlewiz.com.google.android.youtube;;

        # Google Play Music https://play.google.com/store/apps/details?id=com.google.android.music
        music=0)
          remove /system/priv-app/googlewiz.com.google.android.music;;

        # Contacts https://play.google.com/store/apps/details?id=com.google.android.contacts
        contacts=0)
          remove /system/priv-app/googlewiz.com.google.android.contacts;;
        
        # Android Auto https://play.google.com/store/apps/details?id=com.google.android.projection.gearhead
        auto=0)
          remove googlewiz.com.google.android.projection.gearhead;;

        # Google Pay https://play.google.com/store/apps/details?id=com.google.android.apps.walletnfcrel
        pay=0)
          remove /system/priv-app/googlewiz.com.google.android.apps.walletnfcrel;;

        # Google Play Games https://play.google.com/store/apps/details?id=com.google.android.play.games
        games=0)
          remove /system/priv-app/googlewiz.com.google.android.play.games;;

        # Google Backup
        googlebackup=0)
          remove /system/priv-app/GoogleBackupTransport
          remove /system/priv-app/BackupRestoreConfirmation
          remove /system/priv-app/CallLogBackup
          remove /system/priv-app/SharedStorageBackup;;

        # Bixby configuration
        bixby=HOME)
          BIXNEW='key 703 HOME';;
        bixby=BACK)  
          BIXNEW='key 703 BACK';;
        bixby=CAMERA)
          BIXNEW='key 703 CAMERA';;
        bixby=CONTACTS)
          BIXNEW='key 703 CONTACTS';;
        bixby=MESSAGE)
          BIXNEW='key 703 MESSAGE';;
        bixby=CALL)
          BIXNEW='key 703 CALL';;
        bixby=SEARCH)
          BIXNEW='key 703 SEARCH';;
        bixby=CALENDAR)
          BIXNEW='key 703 CALENDAR';;
        bixby=APP_SWITCH)
          BIXNEW='key 703 APP_SWITCH';;
        bixby=SCREENSHOT)
          BIXNEW='key 703 SYSRQ';;
        bixby=ASSISTANT)
          BIXNEW='key 703 VOICE_ASSIST';;
        bixby=NONE)
          BIXNEW='NONE';;
      esac
    done < "$CF"
  else
    $BB echo "-- $CF NOT found, creating dummy" | $BB tee -a $LOGFILE
    # config file is not there, create it
    $BB touch $CF
    
    $BB echo 'clock=1' >> $CF
    $BB echo 'calendar=1' >> $CF
    $BB echo 'mixplorer=1' >> $CF  
    $BB echo 'search=1' >> $CF
    $BB echo 'assistant=1' >> $CF
    $BB echo 'print=1' >> $CF
    $BB echo 'calculator=1' >> $CF
    $BB echo 'mtp=1' >> $CF
    $BB echo 'bluelightfilter=1' >> $CF
    $BB echo 'smartmanager=1' >> $CF
    $BB echo 'launcher=pixel' >> $CF
    $BB echo 'keyboard=gboard' >> $CF
    $BB echo 'adaway=1' >> $CF
    $BB echo 'news=1' >> $CF
    $BB echo 'blacknavbar=0' >> $CF
    $BB echo 'chromecast=1' >> $CF
    $BB echo 'bixby=HOME' >> $CF
    $BB echo 'camera=1' >> $CF
    $BB echo 'photos=1' >> $CF
    $BB echo 'icons=pixel' >> $CF
    $BB echo 'mms=1' >> $CF
    $BB echo 'gmail=1' >> $CF
    $BB echo 'drive=1' >> $CF
    $BB echo 'maps=1' >> $CF
    $BB echo 'chrome=1' >> $CF
    $BB echo 'youtube=1' >> $CF
    $BB echo 'music=1' >> $CF
    $BB echo 'contacts=1' >> $CF
    $BB echo 'auto=1' >> $CF
    $BB echo 'pay=1' >> $CF
    $BB echo 'games=1' >> $CF
    $BB echo 'googlebackup=1' >> $CF

    $BB echo "-- $CF dummy created" | $BB tee -a $LOGFILE
  fi

  if [ "$LAUNCHER" == "false" ]; then
    # there was no launcher line in the config file; keep Pixel Launcher
    remove /system/priv-app/googlewiz.com.teslacoilsw.launcher
    remove /system/priv-app/googlewiz.com.teslacoilsw.launcherclientproxy
  fi
  if [ "$KEYBOARD" == "false" ]; then
    # there was no keyboard line in the config file; keep Swiftkey
    remove /system/priv-app/googlewiz.com.teslacoilsw.launcher
    remove /system/priv-app/googlewiz.com.teslacoilsw.launcherclientproxy
  fi
  if [ "$BLACKNAVBAR" == "false" ]; then
    remove /system/vendor/overlay/SystemuiNavbarBlack.apk
  fi
  if [ "$GOOGLECHROMECAST" == "false" ]; then
    # by default we remove, only if it was true in the config we keep it
    remove /system/priv-app/googlewiz.com.google.android.apps.chromecast
  fi
  if [ ! "$BIXNEW" == "NONE" ]; then
    $BB echo "-- configuring bixby key: $BIXNEW" | $BB tee -a $LOGFILE
    # bixby key configuration
    $BB cat /system/usr/keylayout/Generic.kl | sed 's/key 703   WINK/#key 703   WINK/g' > /system/usr/keylayout/Generic.kl.orig
    $BB echo $BIXNEW > /tmp/keytemp
    $BB cat /system/usr/keylayout/Generic.kl.orig /tmp/keytemp > /system/usr/keylayout/Generic.kl
  else
    $BB echo "-- leaving bixby key unconfigured" | $BB tee -a $LOGFILE
  fi

  $BB sync
  $BB sync

  $BB echo "<< wizconfig.sh script (done)" | $BB tee -a $LOGFILE

  $BB sync
  $BB sync

  $BB cp /data/wizconfig.log /sdcard/

  $BB sync
  $BB sync
}

#######################################################
# remove() Deleting directories & files with validation
# Globals:
#   None
# Arguments:
#   (String) File or directory name
# Returns:
#   None
#######################################################
remove()
{
  if [ -e $1 ]; then
    $BB echo "-- removing: " $1 | $BB tee -a $LOGFILE
    $BB rm -rf $1
  else
    $BB echo "-- ERROR Removing: " $1 | $BB tee -a $LOGFILE;
  fi
}

# Call main function
main "$@"; exit