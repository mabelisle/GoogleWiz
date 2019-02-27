#!/sbin/sh

BB=/sbin/busybox
D2U=/sbin/dos2unix

CF=/sdcard/googlewiz.config

LAUNCHER=false
KEYBOARD=false
BLACKNAVBAR=false
GOOGLECHROMECAST=false

BIXNEW='key 703 HOME'

LOGFILE=/data/wizconfig.log

$BB rm -rf $LOGFILE
$BB echo ">> wizconfig.sh script (start)" | $BB tee -a $LOGFILE

if [ -f "$CF" ]; then
    $BB echo "-- $CF found, converting to UNIX format" | $BB tee -a $LOGFILE
    $D2U $CF
    # parse the config file and delete what we don't need (assuming /system is still mounted)
    while IFS='' read -r line || [[ -n "$line" ]]; do
        $BB echo "-- processing line: $line" | $BB tee -a $LOGFILE
        if [ "$line" == "clock=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleClock" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleClock
        fi
        if [ "$line" == "calendar=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleCalendar" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleCalendar
        fi
        if [ "$line" == "filesgo=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleFilesGo" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleFilesGo
        fi
        if [ "$line" == "mixplorer=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleFilesGo" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyMiXplorer
        fi
        if [ "$line" == "search=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleClock" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleApp
        fi
        if [ "$line" == "assistant=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleAssistant" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleAssistant
        fi
        if [ "$line" == "print=0" ]; then
            $BB echo "-- removing: print framework" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleCloudPrint
            $BB rm -rf /system/app/SPrintSpooler
            $BB rm -rf /system/app/BuiltInPrintService
        fi
        if [ "$line" == "calculator=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleCalculator" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleCalculator
        fi
        if [ "$line" == "mtp=0" ]; then
            $BB echo "-- removing: MTP" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MtpApplication
            $BB rm -rf /system/etc/init/mtpd.rc
            $BB rm -rf /system/bin/mtpd
        fi
        if [ "$line" == "bluelightfilter=0" ]; then
            $BB echo "-- removing: /system/priv-app/BlueLightFilter" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/BlueLightFilter
        fi
        if [ "$line" == "smartmanager=0" ]; then
            $BB echo "-- removing: /system/priv-app/SmartManager_v5" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/SmartManager_v5
        fi
        if [ "$line" == "launcher=nova" ]; then
            if [ "$LAUNCHER" == "false" ]; then
                $BB echo "-- removing: pixel launcher" | $BB tee -a $LOGFILE
                $BB rm -rf /system/priv-app/MyGooglePixelLauncher
                $BB rm -rf /system/priv-app/MyPixelBridge
                LAUNCHER=true
            fi
        fi
        if [ "$line" == "launcher=pixel" ]; then
            if [ "$LAUNCHER" == "false" ]; then
                $BB echo "-- removing: nova launcher" | $BB tee -a $LOGFILE
                $BB rm -rf /system/priv-app/MyLauncher
                $BB rm -rf /system/priv-app/MyLauncherCompanion
                $BB rm -rf /system/priv-app/MyGoogleIconPack
                LAUNCHER=true
            fi
        fi
        if [ "$line" == "keyboard=gboard" ]; then
            if [ "$KEYBOARD" == "false" ]; then
                $BB echo "-- removing: /system/priv-app/MySwiftkey" | $BB tee -a $LOGFILE
                $BB rm -rf /system/app/MySwiftkey
                KEYBOARD=true
            fi
        fi
        if [ "$line" == "keyboard=swiftkey" ]; then
            if [ "$KEYBOARD" == "false" ]; then
                $BB echo "-- removing: /system/priv-app/MyGoogleGboard" | $BB tee -a $LOGFILE
                $BB rm -rf /system/app/MyGoogleGboard
                KEYBOARD=true
            fi
        fi
        if [ "$line" == "googlenow=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleLauncherCompanion" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyLauncherCompanion
        fi
        if [ "$line" == "wallpapers=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleWallpapers" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleWallpapers
        fi
        if [ "$line" == "iconpack=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleIconPack" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleIconPack
        fi
        if [ "$line" == "adaway=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleAdaway" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyAdaway
        fi
        if [ "$line" == "news=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleNews" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleNews
        fi
        if [ "$line" == "tasks=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleTasks" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleTasks
        fi
        if [ "$line" == "blacknavbar=1" ]; then
            $BB echo "-- adding: black navbar" | $BB tee -a $LOGFILE
            BLACKNAVBAR=true
        fi
        if [ "$line" == "chromecast=1" ]; then
            $BB echo "-- adding: /system/priv-app/MyGoogleChromecast" | $BB tee -a $LOGFILE
            GOOGLECHROMECAST=true
        fi
        if [ "$line" == "markup=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleMarkup" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleMarkup/
        fi
        if [ "$line" == "lens=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleLens" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleLens/
        fi
        if [ "$line" == "camera=0" ]; then
            $BB echo "-- removing: /system/priv-app/SamsungCamera7" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/SamsungCamera7/
        fi
        if [ "$line" == "photos=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGooglePhotos" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGooglePhotos/
        fi
        if [ "$line" == "icons=samsung" ]; then
            $BB echo "-- removing: pixel icons" | $BB tee -a $LOGFILE
            $BB rm -rf /system/vendor/overlay/SettigsIcons.apk
            $BB rm -rf /system/vendor/overlay/SystemuiStatusbarIcons.apk
            $BB rm -rf /system/vendor/overlay/SystemuiTilesIcons.apk
            $BB rm -rf /system/vendor/overlay/SystemuiNavbarAOSP.apk
        fi
        if [ "$line" == "mms=0" ]; then
            $BB echo "-- removing: /system/priv-app/MsgCommService" | $BB tee -a $LOGFILE
            $BB echo "-- removing: /system/priv-app/MmsService" | $BB tee -a $LOGFILE
            rm -rf system/priv-app/MsgCommService
            rm -rf system/priv-app/MmsService
        fi
        if [ "$line" == "measure=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleARCore" | $BB tee -a $LOGFILE
            $BB echo "-- removing: /system/priv-app/MyGoogleMeasure" | $BB tee -a $LOGFILE
            rm -rf system/priv-app/MyGoogleARCore
            rm -rf system/priv-app/MyGoogleMeasure
        fi
        if [ "$line" == "gmail=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleGmail/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleGmail/
        fi
        if [ "$line" == "keep=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleKeep/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleKeep/
        fi
        if [ "$line" == "drive=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleDrive/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleDrive/
        fi
        if [ "$line" == "maps=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleMaps/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleMaps/
        fi
        if [ "$line" == "chrome=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleChrome/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleChrome/
        fi
        if [ "$line" == "datally=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleDatally/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleDatally/
        fi
        if [ "$line" == "youtube=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleYoutube/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleYoutube
        fi
        if [ "$line" == "plus=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGooglePlus/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGooglePlus/
        fi
        if [ "$line" == "trips=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleTrips/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleTrips/
        fi
        if [ "$line" == "translate=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleTranslate/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleTranslate/
        fi
        if [ "$line" == "earth=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleEarth/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleEarth/
        fi
        if [ "$line" == "fit=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleFit/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleFit/
        fi
        if [ "$line" == "podcasts=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGooglePodcasts/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGooglePodcasts/
        fi
        if [ "$line" == "music=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleMusic/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleMusic/
        fi
        if [ "$line" == "trustedcontacts=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleTrustedContacts/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleTrustedContacts/
        fi
        if [ "$line" == "auto=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleAuto/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleAuto/
        fi
        if [ "$line" == "snapseed=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleSnapseed/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleSnapseed/
        fi
        if [ "$line" == "photoscanner=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGooglePhotoscanner/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGooglePhotoscanner/
        fi
        if [ "$line" == "docs=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleDocs/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleDocs/
        fi
        if [ "$line" == "slides=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleSlides/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleSlides/
        fi
        if [ "$line" == "sheets=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleSheets/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleSheets/
        fi
        if [ "$line" == "streetview=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleStreetview/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleStreetview/
        fi
        if [ "$line" == "pay=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGooglePay/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGooglePay/
        fi
        if [ "$line" == "mymaps=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleMyMaps/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleMyMaps/
        fi
        if [ "$line" == "musicfx=0" ]; then
            $BB echo "-- removing: /system/priv-app/MyGoogleMusicFX/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/MyGoogleMusicFX/
        fi
        if [ "$line" == "googlebackup=0" ]; then
            $BB echo "-- removing: /system/priv-app/GoogleBackupTransport/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/GoogleBackupTransport/
            $BB echo "-- removing: /system/priv-app/BackupRestoreConfirmation/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/BackupRestoreConfirmation/
            $BB echo "-- removing: /system/priv-app/CallLogBackup/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/CallLogBackup/
            $BB echo "-- removing: /system/priv-app/SharedStorageBackup/" | $BB tee -a $LOGFILE
            $BB rm -rf /system/priv-app/SharedStorageBackup/
        fi

        # bixby configuration
        if [ "$line" == "bixby=HOME" ]; then
            BIXNEW='key 703 HOME'
        fi
        if [ "$line" == "bixby=BACK" ]; then
            BIXNEW='key 703 BACK'
        fi
        if [ "$line" == "bixby=CAMERA" ]; then
            BIXNEW='key 703 CAMERA'
        fi
        if [ "$line" == "bixby=CONTACTS" ]; then
            BIXNEW='key 703 CONTACTS'
        fi
        if [ "$line" == "bixby=MESSAGE" ]; then
            BIXNEW='key 703 MESSAGE'
        fi
        if [ "$line" == "bixby=CALL" ]; then
            BIXNEW='key 703 CALL'
        fi
        if [ "$line" == "bixby=SEARCH" ]; then
            BIXNEW='key 703 SEARCH'
        fi
        if [ "$line" == "bixby=CALENDAR" ]; then
            BIXNEW='key 703 CALENDAR'
        fi
        if [ "$line" == "bixby=APP_SWITCH" ]; then
            BIXNEW='key 703 APP_SWITCH'
        fi
        if [ "$line" == "bixby=SCREENSHOT" ]; then
            BIXNEW='key 703 SYSRQ'
        fi
        if [ "$line" == "bixby=ASSISTANT" ]; then
            BIXNEW='key 703 VOICE_ASSIST'
        fi
        if [ "$line" == "bixby=NONE" ]; then
            BIXNEW='NONE'
        fi
    done < "$CF"
else
    $BB echo "-- $CF NOT found, creating dummy" | $BB tee -a $LOGFILE
    # config file is not there, create it
    $BB touch $CF
    $BB echo 'clock=1' >> $CF
    $BB echo 'calendar=1' >> $CF
    $BB echo 'filesgo=1' >> $CF
    $BB echo 'search=1' >> $CF
    $BB echo 'assistant=1' >> $CF
    $BB echo 'print=1' >> $CF
    $BB echo 'calculator=1' >> $CF
    $BB echo 'mtp=1' >> $CF
    $BB echo 'bluelightfilter=1' >> $CF
    $BB echo 'smartmanager=1' >> $CF
    $BB echo 'launcher=nova' >> $CF
    $BB echo 'keyboard=swiftkey' >> $CF
    $BB echo 'googlenow=1' >> $CF
    $BB echo 'wallpapers=1' >> $CF
    $BB echo 'iconpack=1' >> $CF
    $BB echo 'adaway=1' >> $CF
    $BB echo 'news=1' >> $CF
    $BB echo 'blacknavbar=0' >> $CF
    $BB echo 'tasks=1' >> $CF
    $BB echo 'chromecast=1' >> $CF
    $BB echo 'markup=1' >> $CF
    $BB echo 'lens=1' >> $CF
    $BB echo 'bixby=HOME' >> $CF
    $BB echo 'camera=1' >> $CF
    $BB echo 'photos=1' >> $CF
    $BB echo 'mms=1' >> $CF
    $BB echo 'measure=1' >> $CF
    $BB echo 'gmail=1' >> $CF
    $BB echo 'keep=1' >> $CF
    $BB echo 'drive=1' >> $CF
    $BB echo 'maps=1' >> $CF
    $BB echo 'chrome=1' >> $CF
    $BB echo 'datally=1' >> $CF
    $BB echo 'youtube=1' >> $CF
    $BB echo 'plus=1' >> $CF
    $BB echo 'trips=1' >> $CF
    $BB echo 'translate=1' >> $CF
    $BB echo 'earth=1' >> $CF
    $BB echo 'fit=1' >> $CF
    $BB echo 'podcasts=1' >> $CF
    $BB echo 'music=1' >> $CF
    $BB echo 'trustedcontacts=1' >> $CF
    $BB echo 'auto=1' >> $CF
    $BB echo 'snapseed=1' >> $CF
    $BB echo 'photoscanner=1' >> $CF
    $BB echo 'docs=1' >> $CF
    $BB echo 'slides=1' >> $CF
    $BB echo 'sheets=1' >> $CF
    $BB echo 'streetview=1' >> $CF
    $BB echo 'mymaps=1' >> $CF
    $BB echo 'bixby=HOME' >> $CF
    $BB echo 'musicfx=1' >> $CF
    $BB echo 'googlebackup=1' >> $CF

    $BB echo "-- $CF dummy created" | $BB tee -a $LOGFILE
fi

if [ "$LAUNCHER" == "false" ]; then
    # there was no launcher line in the config file; keep Nova
    $BB echo "-- no launcher line: removing /system/priv-app/MyGooglePixelLauncher" | $BB tee -a $LOGFILE
    $BB rm -rf /system/priv-app/MyGooglePixelLauncher
    $BB rm -rf /system/priv-app/MyPixelBridge
fi
if [ "$KEYBOARD" == "false" ]; then
    # there was no keyboard line in the config file; keep Swiftkey
    $BB echo "-- no keyboard line: removing /system/priv-app/MyGoogleGboard" | $BB tee -a $LOGFILE
    $BB rm -rf /system/app/MyGoogleGboard
fi
if [ "$BLACKNAVBAR" == "false" ]; then
    # by default we remove the black nav bar, only if it was true in the config we keep it
    $BB echo "-- /system/priv-app/overlay.systemui.navbar.black/" | $BB tee -a $LOGFILE
    $BB rm -rf /system/priv-app/overlay.systemui.navbar.black/
fi
if [ "$GOOGLECHROMECAST" == "false" ]; then
    # by default we remove, only if it was true in the config we keep it
    $BB echo "-- /system/priv-app/MyGoogleChromecast" | $BB tee -a $LOGFILE
    $BB rm -rf /system/priv-app/MyGoogleChromecast
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

$BB echo "\<\< wizconfig.sh script (done)" | $BB tee -a $LOGFILE

$BB sync
$BB sync

$BB cp /data/wizconfig.log /sdcard/

$BB sync
$BB sync
