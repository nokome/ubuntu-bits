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

sudo add-apt-repository ppa:alexmurray/indicator-sensors
sudo apt-get update
sudo apt-get install indicator-sensors
```

### Install password storage

Because these days, without passwords, you can't do much...

```sh
sudo apt-get install keepass2 
```

### Install Last.fm palyer

Because I like listening to music while I work...

```sh
sudo /etc/sources.list
deb http://apt.last.fm/debian precise main
sudo apt-get update
sudo apt-get install lastfm-scrobbler
```

### Install development tools


### Install WINE and Microsoft Office




