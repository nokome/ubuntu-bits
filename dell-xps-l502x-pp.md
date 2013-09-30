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

### Install fish shell

Because life is too short to be using monochrome command shells with no autosuggestions

```sh
cd ~/Downloads
wget http://fishshell.com/files/2.0.0/linux/Debian_6.0/i586/fish_2.0.0-201305151006_i386.deb
sudo dpkg -i fish_2.0.0-201305151006_i386.deb
```

In Gnome Terminal right click and go to `Profile>Profile Preference` and set `fish` as the starting command.
Run `fish_config` to set colour and prompt preferences.

### Install password storage

Because these days, without passwords, you can't do much...

```sh
sudo apt-get install keepassx 
```

### Install Chrome

Because its clean and fast...

Download and run the deb file at https://www.google.com/intl/en/chrome/browser/

### Install Last.fm palyer

Because I like listening to music while I work...

```sh
sudo add-apt-repository "deb http://apt.last.fm/debian precise main"
sudo apt-get update
sudo apt-get install lastfm-scrobbler
```

There is a bug in the laucher fix it with this...

```sh
sudo sed -i 's/Exec=\/usr\/bin\/lastfm-client/Exec=\/usr\/bin\/lastfm-scrobbler/g' /usr/share/applications/lastfm-client.desktop
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

### Install gcc-4.8 & g++-4.8

Because its really nice to have all those [C++11 features](http://gcc.gnu.org/gcc-4.8/cxx0x_status.html)[...](http://askubuntu.com/questions/271388/how-to-install-gcc-4-8-in-ubuntu-12-04-from-the-terminal)

```sh
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install gcc-4.8 g++-4.8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 50
```


### Install Python PIP

Because every language needs a good package manager...

```sh
sudo apt-get install python-pip
```

### Install R and RStudio

Because if you are doing anything with data...

```sh
sudo add-apt-repository "deb http://cran.stat.auckland.ac.nz/bin/linux/ubuntu precise/"
sudo apt-get update
sudo apt-get install r-base r-base-dev
```

```sh
cd ~/Downloads
wget http://download1.rstudio.org/rstudio-0.97.551-amd64.deb
sudo dpkg -i rstudio-0.97.551-amd64.deb
```

### Install Skype

Because we talk...

```sh
sudo apt-add-repository "deb http://archive.canonical.com/ precise partner"
sudo apt-get update
sudo apt-get install skype
```

### Install WINE and Microsoft Office 2007

Because a lot of the world still uses MS Office and LibreOffice doesn't always play nice, particularly with formatting

```sh
sudo apt-get install wine
```

Put in the Office CD-ROM, then to [ensure 32-bit WINE installation](http://appdb.winehq.org/objectManager.php?sClass=version&iId=4992)

```sh
WINEARCH=win32 WINEPREFIX=/home/nbentley/.wine32 winecfg
WINEARCH=win32 WINEPREFIX=/home/nbentley/.wine32 wine /media/OFFICE12/setup.exe
```
See the "Post Installation Instructions" at http://appdb.winehq.org/objectManager.php?sClass=version&iId=4992


### Fix touch pad

Some where along the way my [touch pad stopped working](http://askubuntu.com/questions/262287/synaptic-touchpad-on-laptop-not-working)

```sh
sudo nano /etc/modprobe.d/psmouse.conf
options psmouse proto=imps
```

