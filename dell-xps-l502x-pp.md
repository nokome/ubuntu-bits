## Ubuntu Precise Pangolin (12.04.3) on a Dell XPS L502X

These are my notes for my personal setup. Your preferences may differ.
A useful guide is for this setup is available [here](http://hanynowsky.wordpress.com/2012/04/07/dell-xps-15-l502x-ubuntu-linux/)

### Install Ubuntu

Install Ubuntu 12.04.3 64 bit ISO from a [bootable USB stick](http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-ubuntu), noting:

- USB stick must be in USB 2.0/E-Sata port (right hand side) instead of the USB 3.0 port (otherwise the installation will fail)
- Do "Download updates while installing"
- Do NOT "Install this third party software"

### Setup triple monitors

An important aspect for me in this setup was to have a three monitors, the laptop's builtin screee and two external monitors.
This can be done on the L502X using the two video cards and the Nvidia Optimus technology via Bumblebee.

See my separate [guide](optimus-triple-monitor.md) for this.


### Customize Nautilus

`Edit > Preferences` ...

```sh
sudo apt-get install nautilus-open-terminal
nautilus -q
```

### Install Chrome

Because its clean and fast...

Download and run the deb file at https://www.google.com/intl/en/chrome/browser/


### Install system monitoring tools

Because it's good to see where your computer is at...

```sh
sudo apt-get install indicator-multiload
```

```sh
sudo add-apt-repository ppa:alexmurray/indicator-sensors
sudo apt-get update
sudo apt-get install indicator-sensors
```

Go to the HUD and launch sensors and then check preference to autostart.

### Install password storage

Because these days, without passwords, you can't do much...

```sh
sudo apt-get install keepassx 
```

### Install Last.fm palyer

Because I like listening to music while I work...

```sh
sudo add-apt-repository "deb http://apt.last.fm/debian precise main"
sudo apt-get update
sudo apt-get install lastfm-scrobbler
```

### Install Sublime Text

Because its, ahh, sublime...

```sh
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer
```

Add package manager as per https://sublime.wbond.net/installation

Then `Ctrl+Shift+P` to bring up the command pallette and then Select "Package Control: Install Package" to get these useful packages:

- SublimeLinter
- SideBarEnhancements
- SublimeCodeIntel
- BracketHighlighter
- DocBlockr
- SublimeGDB

For SublimeLinter in Sublime Text 3 [you have to](http://harrywolff.com/upgrading-to-sublime-text-3/)...

```sh
cd ~/.config/sublime-text-3/Packages
git clone https://github.com/SublimeLinter/SublimeLinter.git
cd SublimeLinter
git checkout sublime-text-3
```

### Install WINE and Microsoft Office 2007

Because many of my collegues use Office and LibreOffice doesn't always play nice, particularly with formatting

```sh
sudo apt-get install wine
```

Put in the Office CD-ROM, then to [ensure 32-bit WINE installation](http://appdb.winehq.org/objectManager.php?sClass=version&iId=4992)

```sh
WINEARCH=win32 WINEPREFIX=/home/nbentley/.wine32 winecfg
WINEARCH=win32 WINEPREFIX=/home/nbentley/.wine32 wine /media/OFFICE12/setup.exe
```
See the "Post Installation Instructions" at http://appdb.winehq.org/objectManager.php?sClass=version&iId=4992




