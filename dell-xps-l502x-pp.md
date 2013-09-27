## Ubuntu Precise Pangolin (12.04.3) on a Dell XPS L502X

These are my notes for my personal setup. Your preferences may differ.
A useful guide is for this setup is available [here](http://hanynowsky.wordpress.com/2012/04/07/dell-xps-15-l502x-ubuntu-linux/)

### Install `Ubuntu`

Install Ubuntu 12.04.3 64 bit ISO from a [bootable USB stick](http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-ubuntu), noting:

- USB stick must be in USB 2.0/E-Sata port (right hand side) instead of the USB 3.0 port (otherwise the installation will fail)
- Do "Download updates while installing"
- Do NOT "Install this third party software"

### Setup triple monitors

An important aspect for me in this setup was to have a three monitors, the laptop's builtin screee and two external monitors.
This can be done on the L502X using the two video cards and the Nvidia Optimus technology via Bumblebee.

See my separate [guide](optimus-triple-monitor.md) for this.

