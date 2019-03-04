# *** ![alt logo](img/google_logo.png)Wiz *** Pixelize your Galaxy S8
## *"Extreme debloat: Go where Samsung has never gone before"*

This is an **extremely debloated Samsung oreo rom** with absolutely minimal Samsung functionality mimicing the look and feel of a Google pixel. The basic apps **(dialer, messaging, contacts, gallery, keyboard)** are from Google. ROM works on G950F (S8) and G955F (S8+) (I only tested S8 as I do not own an S8+). Should work on SM-950FD as well as reported in [https://forum.xda-developers.com/sho...&postcount=332](https://forum.xda-developers.com/showpost.php?p=75844308&postcount=332). Personally I very much like the Samsung phones/hardware but I am not so fond of the software and bloatware. **If you want Samsung stuff, stop reading, press the BACK button on your browser, and use another ROM !!!**

## Upfront "warning"
This ROM is integrated with (a) the NX kernel and (b) a slightly patched version of Magisk. Flashing another kernel on this ROM might BREAK things. Same holds for Magisk. I always use the latest versions of the kernel / Magisk in the new releases so there is no need to upgrade kernel / Magisk yourself. You have no benefit whatsoever in doing that anyway.

## Features
The ROM contains (only) the following Samsung applications: Settings (you can't get rid of this), Camera (because it uses all hardware capabilities of the phone at best); camera patched to use Google Photos as "gallery"; camera can be removed via the googlewiz.config file (see below), Lockscreen & AOD (Always On Display), Fingerprint & iris scanning, Blue light filter (optional), Smartmanager (optional).
- Android Oreo 8.0
- Google
    - pixel launcher (https://github.com/amirzaidi/Launcher3) or Nova launcher (https://play.google.com/store/apps/details?id=com.teslacoilsw.launcher)
    - play services (which can be put into doze mode)
    - play store (https://play.google.com/store)
    - gBoard (https://play.google.com/store/apps/details?id=com.google.android.inputmethod.latin) or SwiftKey keyboard (https://play.google.com/store/apps/details?id=com.touchtype.swiftkey)
    - photos (used as gallery; integrated with camera) [as of v23] (https://play.google.com/store/apps/details?id=com.google.android.apps.photos)
    - dialer (https://play.google.com/store/apps/details?id=com.google.android.dialer)
    - contacts (https://play.google.com/store/apps/details?id=com.google.android.contacts)
    - messaging (https://play.google.com/store/apps/details?id=com.google.android.apps.messaging)
    - text-to-speech (https://play.google.com/store/apps/details?id=com.google.android.tts)
    - Google Sans fonts (https://storage.googleapis.com/g-design/static/product-sans-specimen.pdf)
    - android P emoji (https://arstechnica.com/gadgets/2018/06/android-p-preview-3-hands-on-heres-all-157-new-emoji-some-ui-tweaks/)
    - pixel boot animation (https://www.youtube.com/watch?v=ooFrL4innVM)
    - pixel icons in settings, statusbar, quick settings
    - pixel ringtones, notifications, UI sounds
    - pixel navbar (with possibility to have black navbar)
    - camera2 API enabled
    - PDF viewer from Google
    - Google optional features & apps (can be configured via googlewiz.config file; see below)
        - gmail (https://play.google.com/store/apps/details?id=com.google.android.gm)
        - drive (https://play.google.com/store/apps/details?id=com.google.android.apps.docs)
        - maps (https://play.google.com/store/apps/details?id=com.google.android.apps.maps)
        - chrome (https://play.google.com/store/apps/details?id=com.android.chrome)
        - clock (with Spotify integration) (https://play.google.com/store/apps/details?id=com.google.android.deskclock)
        - calendar (https://play.google.com/store/apps/details?id=com.google.android.calendar)
        - calculator (https://play.google.com/store/apps/details?id=com.google.android.calculator)
        - search app integrated with Nova search bar (https://www.google.com/search/about/)
        - assistant (https://www.apkmirror.com/apk/google-inc/google-assistant/) (only works if language = English)
        - translate (https://play.google.com/store/apps/details?id=com.google.android.apps.translate)
        - cloud Printing (and local printing) (https://www.google.com/cloudprint/)
        - now cards integrated with Nova launcher see (https://forum.xda-developers.com/showpost.php?p=75591011&postcount=4)
        - lens photo analysis in photos app (only when language = English; read hints and tips section for other languages)
        - at a Glance widget (part of Google search app)
        - news (https://play.google.com/store/apps/details?id=com.google.android.apps.magazines)
        - Google Home (aka chromecast) (https://play.google.com/store/apps/details?id=com.google.android.apps.chromecast.app)
        - youtube (https://play.google.com/store/apps/details?id=com.google.android.youtube)
        - pay (https://play.google.com/store/apps/details?id=com.google.android.apps.walletnfcrel)
        - pixel icon pack for Nova launcher
        - pixel wallpapers (https://forum.xda-developers.com/showpost.php?p=77020268&postcount=1989)
        - weather (just type "weather" in the google search app; it will offer you to get an icon on the desktop)
        - music (https://play.google.com/store/apps/details?id=com.google.android.music)
        - android auto (Google's car mode) (https://play.google.com/store/apps/details?id=com.google.android.projection.gearhead)
        - google backup
- No weird Samsung background services
- No need for a Samsung account; only a Google account
- Rooted with Magisk (see https://forum.xda-developers.com/apps/magisk)
- Magisk manager (see https://forum.xda-developers.com/apps/magisk)
- Working Magisk SafetyNet
- Configurable installer (no aroma; simple text file) which allows to remove some Google apps if you don't like them (see below) and tweak some options
- Auto enablement of overlays at boot time
- Know warranty 0x0
- Modified build.prop (performance tweaks)
- Based on February 2019 security update from Samsung (base G950FXXS4CSB1)
- Configurable BIXBY key (by default mapping to Nova home screen)
- Configurable immersive mode (none, hide navbar, hide navbar and statusbar)
- MTP (optional)
- MMS (optional) some people still seem to use this tech)
- Knox and tima removed fully ... no, I really mean FULLY ... also from kernel ramdisk where possible
- /etc/init.d and /etc/services.d (in case you want to add custom scripts put them in /sdcard/init.d/)
- /omr and /preload mounting removed (if you don't know what this is, don't worry)
- ROM does not contain country specific CSCs; all settings generic
- Fix lack of voice in Google app when reading answers to a search
- NX kernel (see credits below)
- Bluetooth aptx
- bash shell (with bashrc and bash_aliases in /etc/bash/)
- AdAway (optional)
- Black nav bar (optional; only useful if you plan to have dark/black themes with Substratum)
- BusyBox v1.29.2
- Improved dozing & reduced battery consumption in sleep mode
- Fast ... very fast ... no useless Samsung background daemons; processes optimized via cgroups ... and many optimization settings and tweaks
- Good battery life
- OEM unlock on by default (cannot be turned off; will be shown as OFF in Settings => don't worry about this)
- Netflix fix
- Manage SMS/text messages from your browser (https://messages.android.com/)
- Auto cleanup and sqlite DB optimization at boot time

## What is NOT in the ROM
I have left out loads of stuff ... mainly because I don't use these features ... and/or they are Samsung specific. Don't ask me to integrate Samsung specific features because I won't: Samstuff stuff (all left out), Live wallpapers, Wear and Gear (but read further below please), Multiwindow, Clearcover, Edge, Docking, DEX, No call recording for now, Samsung dual messenger, VoIP (wifi calling) and VoLTE (but read further below for VoLTE), ...

## Telegram
No telegram group; I don't have time for that, so stop asking please.

## Bootloaders
See post #2 below; https://forum.xda-developers.com/showpost.php?p=75590991&postcount=2

## Changelog
See post #3 below; https://forum.xda-developers.com/showpost.php?p=75591002&postcount=3

## Hints & tips
See post #4 below; https://forum.xda-developers.com/showpost.php?p=75591011&postcount=4

## (Re)Using this work
Other devs, please feel free to (re)use this for your own work ... I am not asking anything from anybody, no donation, no thanks, no beer  ... you don't even have to mention that you (re)use this. We are here on XDA to share and learn from eachother.

## Disclaimer
I will try to support questions / feedback. I will not answer questions such as "Can you please add Samsung feature X,Y,Z" ... I have deliberately removed them. If you want Samsung, go and use a Samsung ROM. There are instructions further down on how to create your own variant of the ROM so you can do this yourself if you want to add stuff. I will not answer PMs (don't have time to look at them). I have attached also a bash script (as .txt file). This is the script which I personally use to generate the ROM starting from a standard Samsung system.img. If you are a DEV, you can study this to see how I create this ROM. Again, feel free to (re)use. The usual applies: no warranty, installing this will trip KNOX, install at your own risk, ... I am not responsible for soft or hard bricks. Your phone must have TWRP to install this ROM. If your phone is bricked, your best guess is to try and flash the ORIGINAL Samsung firmware with Odin. Do repeat{ search, read }.

## Download (multiple versions):
https://www.androidfilehost.com/?w=files&flid=239365 (up to release v65). Files are called: googlewiz_oreo_vXX.zip.
As of release v66, ROM has been uploaded to mega.nz: see https://mega.nz/#F!WUQ2DYpJ!5l3fVDpoXSdHO8p2IfKCvA
See post #3 for a changelog. Please read it as it may answer some of your questions. As of release v92, ROM has been uploaded into releases on GitHub https://github.com/mabelisle/GoogleWiz/releases.

## Theming
ROM has no Samsung themestore. Install Substratum (https://play.google.com/store/apps/details?id=projekt.substratum) and a samsung compatible substratum theme (e.g. https://play.google.com/store/apps/details?id=com.sec.android.app.shealth)

## Splash screen
To make your phone more "GoogleWiz", try the google splash screen. See: https://forum.xda-developers.com/sho...&postcount=189
WARNING: ONLY FOR G950F !!! Do *NOT* flash this on other models; your phone WILL go into soft brick - I warned you.

## Other stuff
For heart rate / stress monitor: install SHealth (https://play.google.com/store/apps/details?id=com.sec.android.app.shealth) from the play store.

## Known bugs / issues
- "Game" battery saving mode is not working (due to Samsung stuff removed from ROM); will FC settings app
- Device encryption will not work (as it relies on Samsung KNOX which has been fully removed
- Android for work will not function
- Advanced functions in settings: most of them don't work
- On a clean install, first screen might show a Magisk error, just ignore it

## Installation
Make sure first that "OEM unlock" is enabled in your developer settings (if you don't understand what this means then this ROM is not for you). 
Make sure to flash the Oreo bootloader (see post #2) if you come from Nougat. 
- click WIPE and then FORMAT DATA (do this ONCE when you come from Nougat) => then reboot into TWRP
- Wipe /system, /data and /cache (for a normal clean install)
- put the googlewiz_oreo_vXX.zip onto your /sdcard
- wipe data, system, dalvik, cache
- flash bootloader (if you come from Nougat)
- flash ROM
- reboot

Please mention the device and release you are on when reporting bugs.

## ROM updates
The ROM only touches the /system partition. ROM does not update bootloader, nor modem (baseband). Most ROM updates can be dirty flashed except when the release notes mention clearly that you need to do a clean install (in that case, wipe your /data). Instructions for flashing a modem can be found in: https://forum.xda-developers.com/sho...postcount=3196

## Adblocking
For adblocking without AdAway (everywhere: both in browser and apps) do the following:
```
> adb shell
# su
# hl
```

The "hl" command will replace the hosts file with a huge (> 200000) hosts which refer to IP address 0.0.0.0; this will make ads go away in your browser and applications. No ad-blocking app is required. If you want to restore the original hosts file, use the command "hs" (ads will come back then). The "hl" command is agressive; some web pages or apps might not work properly. To use a less aggressive ad blocking use the command "hm" (this uses a hosts file similar to adaway without having the need to install that app).

## /etc/init.d, /etc/services.d and /sdcard/init.d
/etc/init.d scripts are running once /data is mounted; do not rely on any Android functionality in those scripts as Android is not fully initialized when these scripts run. Use /etc/services.d if you want to rely on Android functionality; scripts in /etc/services.d are ran later than /etc/init.d; see post https://forum.xda-developers.com/showpost.php?p=76901055&postcount=1771 for more details. You can put user scripts on /sdcard/init.d/; they will be ran last.

## Writeable /system partition
Use "sysrw" and "sysro" in an adb shell to make the /system partition writeable/read-only; note that Magik's safeynet will NOT work if the /system partition is writeable (this is normal behavior).

## Building a variant of this ROM
Attached (linux; bash) script gives you a clue of how the ROM was created starting from a stock system.img ext4 image file from Samsung.

## Kernel
This ROM uses NX kernel and optimizations tightly coupled to it. Installing another kernel may have all sorts of side effects which I will not support you with. You have been warned.

## Screenshots
Screenshots in attach. Black screenshots taken from my own fully installed phone, after theming with substratum (https://play.google.com/store/apps/details?id=projekt.substratum) and using the following theme: https://play.google.com/store/apps/details?id=com.brit.swiftblack.layers. All launcher screenshots (except the last one) are with the Nova launcher. Last screenshot shows the Google Pixel launcher.

## Configurable installer
You can remove apps from the ROM and do some customizations. Create a simple text file with the content below. The file must be called "googlewiz.config". You should push it via adb onto /sdcard BEFORE installation. Then install the ROM via TWRP. The installer will read this file and remove the google apps which have "=0". There should be no spaces, i.e. "clock=1" instead of "clock = 1". I think you get the idea. It's not rocket science. If the file is not on /sdcard, everything remains in the ROM (with Nova as launcher and Swiftkey as keyboard). This config mechanis is very simple, avoids aroma, and still allows a bit of configuration. So as an absolute minimum (assuming you remove all above) you will have in your app drawer: Messaging, Camera, Contacts, Photos, Settings, Magisk, Nova Google Companion, Nova settings, Play Store, Swiftkey, Phone. (Nova Google companion icon will go away once clicked and OK).
Code:
```
clock=1
calendar=1
mixplorer=1
search=1
assistant=1
print=1
calculator=1
mtp=1
bluelightfilter=1
smartmanager=1
launcher=pixel
keyboard=gboard
adaway=1
news=1
blacknavbar=0
chromecast=1
bixby=HOME
camera=1
photos=1
icons=pixel
mms=1
gmail=1
drive=1
maps=1
chrome=1
youtube=1
music=1
contacts=1
auto=1
pay=1
games=1
googlebackup=1
```
clock = Google clock; calendar = Google calendar; mixplorer = Mix Explorer; search = Google app; assistant = Google Assistant; print = Google cloudprinter and printing framework; calculator = Google calculator; mtp = MTP connectivity to PC; bluelightfilter = Blue Light Filter; smartmanager = Device Maintenance (in Settings); adaway = Adaway; news = Google News; tasks = Google Tasks; blacknavbar = Black Nav Bar (not installed by default; set to 1 if you want it); chromecast = Google home (not installed by default; set to 1 if you want it); camera = Samsung camera; photos = Google photos; mms = MMS; gmail = Google gmail; drive = Google drive; maps = Google maps; chrome = Google chrome browser; youtube = Google youtube; plus = Google+; earth = Google earth; translate = Google translate; trips = Google trips; fit = Google fit; podcasts = Google podcasts; music = Google music; contacts = Google contacts; auto = Android car mode; pay = Google Pay; games = Google Play Games; googlebackup = Google backup

For Nova launcher (default); put "launcher=nova" in the config file. For Google Pixel launcher, put "launcher=pixel" in the config file.
For Swiftkey keyboard (default); put "keyboard=swiftkey" in the config file. For Google Gboard, put "keyboard=gboard" in the config file.
Switching between keyboards across releases may cause keyboard not to work properly when you dirty flash; if you decide to switch keyboard across 2 releases, do a clean flash.

The pixel icon pack only works with Nova launcher. If you use the Pixel launcher the icon pack will not be installed (even if you have "iconpack=1" in the configuration).

Screen usage option: "immersive". Possible values are "none", "navbar" and "full". "none" means that both navbar and statusbar are always visible. "navbar" means that the navbar is not visible (swipe from the bottom of the screen to display the navbar). "full" means that both navbar AND statusbar are invisible (swipe from the top or bottom of the screen to make them visible).

The ROM uses pixel icons in the settings, statusbar, tiles, navbar; if you (really?) prefer the original Samsung icons, put "icons=samsung" in the googlewiz.config file.

If you want to know how this works, unzip the ROM and look at scripts/simpleconfig.sh. It is a very simple config mechanism which avoids a complex installer with aroma.

## Configurable BIXBY key
By default, the BIXBY ket is set to HOME: the nova launcher home screen. You can put a line in googlewiz.config: "bixby=X" with X being one off {HOME, BACK, CAMERA, CONTACTS, MESSAGE, CALL, SEARCH, CALENDAR, APP_SWITCH, SCREENSHOT, ASSISTANT}

example: "bixby=CAMERA" or "bixby=CALENDAR"

If you put "bixby=NONE" the bixby key remains unbound. This should allow 3rd party button remappers to work.

Code:
```
HOME = Nova launcher home screen
BACK = go one step back (same as back key in navbar)
CAMERA = open camera; once in the camera pressing the bixby key takes a picture
CONTACTS = open Google Contacts app
MESSAGE = open Google Messaging app
CALL = open Google Phone app
SEARCH = perform search in the current application
CALENDAR = open Google Calendar
APP_SWITCH = open screen where you can switch between running apps (same as "recents" key in navbar)
SCREENSHOT = take a screenshot
ASSISTANT = Google assistant (of course will not work if you have "assistant=0" in your googlewiz.config)
NONE = do not bind the bixby key; should allow 3rd party remappers to work
```
## VoLTE
Many people ask for VoLTE. I can't do it properly ... sorry ... not for now ... my provider does NOT support VoLTE ... which means that I cannot test anything. In addition, VoLTE is CSC specific configuration and all CSC config has been currently removed from the ROM. It is tricky to bring this back into the ROM ... especially if I cannot test anything. I would just be working in total darkness. Please understand this. If there is a DEV wiling to help let me know. However, see post: https://forum.xda-developers.com/showpost.php?p=77598885&postcount=2888 and post https://forum.xda-developers.com/showpost.php?p=77597891&postcount=2885, these might give some hints to try and make it work.

Good news: Some people have VoLTE running; see the following posts; thanks to @meldrak and @kuduku
https://forum.xda-developers.com/showpost.php?p=77663720&postcount=2966
https://forum.xda-developers.com/showpost.php?p=77669115&postcount=2984

## Android wear and Samsung gear
Android wear is not working. Same point as for VoLTE. I do not own a wear device which means that I cannot test anything. If there is a DEV wiling to help I can explain what to try. Samsung gear is working but you need to flash additional package on top of the ROM; see post https://forum.xda-developers.com/showpost.php?p=76412043&postcount=1102. I have not personally tested this (as I don't own a device); but user zoltain73 tested it (https://forum.xda-developers.com/showpost.php?p=77669115&postcount=2984).

## Live wallpapers
No live wallpapers in the ROM. However, if you really want this, flash the package attached to the following post: https://forum.xda-developers.com/showpost.php?p=76887206&postcount=1752

## Bluetooth and audio
Some users are reporting bluetooth audio issues with Bose headsets. Enable developer settings and set the bluetooth audio coded to SBC. Check again if audio works.

## Google ChromeCast
Screen mirroring to a Google ChromeCast works out of the box. You need to install the Google Home app (put "chromecast=1" in the googlewiz.config file before installing the ROM). If you really(?) want Samsung's mirror link, flash the zip file attached to post https://forum.xda-developers.com/showpost.php?p=77390484&postcount=2610.

## Google Pay
Google Pay confirmed working (of course your bank/card has to support it). See https://forum.xda-developers.com/sho...postcount=3716

## Credits
- topjohnwu for Magisk (https://forum.xda-developers.com/apps/magisk/official-magisk-v7-universal-systemless-t3473445)
- BSDgeek_Jake for the adblock hosts file MoaAB (https://forum.xda-developers.com/showthread.php?t=1916098)
- jayantraj for the pixel boot animation (https://forum.xda-developers.com/galaxy-s5/themes-apps/6-0-google-pixel-boot-animation-samsung-t3528179)
- Noxxxious for the NX Kernel (https://forum.xda-developers.com/galaxy-s8/samsung-galaxy-s8--s8-cross-device-development/kernel-nox-kernel-v1-t3721469)
- ambasadii for pointing me out the copy/paste fix, thanks a lot man! (https://forum.xda-developers.com/member.php?u=4074799)
- Marne Jr. for testing on SM-950FD (https://forum.xda-developers.com/showpost.php?p=75844308&postcount=332)
- ohayubaka for the Google pixel icons for settings, statusbar, tiles (https://play.google.com/store/apps/dev?id=8125305976905979352)
- zaac for the navbar overlay (https://forum.xda-developers.com/galaxy-s8/themes/theme-systemui-overlays-samsung-t3735167)
- Saurabh Gupta for the Google pixel icon pack (https://play.google.com/store/apps/details?id=com.themezilla.pixelui)
- Tyler Nymeh for the way to change doze settings (https://www.reddit.com/r/GalaxyNote8/comments/7p3q16/app_tool_comatose_standby_battery_drain_solution/)
- amirzaidi for the rootless pixel launcher (https://github.com/amirzaidi/Launcher3)
- crossbreeder team for cgroup optimizations (https://forum.xda-developers.com/showthread.php?t=2113150)
- Google for the Product Sans fonts (https://storage.googleapis.com/g-design/static/product-sans-specimen.pdf)
- Google for the pixel wallpapers and media sounds

## XDA:DevDB Information
GoogleWiz, ROM for the Samsung Galaxy S8

## Contributors
[https://forum.xda-developers.com/member.php?u=3463514]foobar66
[https://forum.xda-developers.com/member.php?u=4191970]mabelisle
ROM OS Version: 8.x Oreo

## Version Information
Status: Stable
