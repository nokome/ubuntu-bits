## Optimus Triple Monitor setup

These are my personal notes for setting up three monitors, the laptop's builtin 
screen and two external monitors, for my Dell XPS L502X laptop.
This can be done by taking advantage of the two builtin video cards using 
Nvidia Optimus technology via [Bumblebee](http://bumblebee-project.org/) and
[hybrid-screenclone](https://github.com/liskin/hybrid-screenclone)

The best guide's I found for this were [Sagar's](http://sagark.org/optimal-ubuntu-graphics-setup-for-thinkpads/) 
and [Gordin's](http://blog.gordin.de/post/optimus-guide). Thanks! 
Below I mostly repeat their instructions with any minor modifications that I had to make.

### Install Bumblebee

```sh
sudo add-apt-repository ppa:bumblebee/stable
sudo apt-get update
sudo apt-get install bumblebee bumblebee-nvidia
sudo reboot
```

### Patch `xserver-xorg-video-intel`

Apply [liskin's patch](https://github.com/liskin/patches/blob/master/hacks/xserver-xorg-video-intel-2.18.0_virtual_crtc.patch) 
so that the Intel Graphics Driver supports a VIRTUAL display which will be `screenclone`'d to the NVidia card.

Initially when I applied this patch (doing the commands below) my system hung on reboot.
I found I had to use updated version (2.19.0 instead of 2.17.4) of `xserver-xorg-video-intel` 
from `ubuntu-x-swat` to avoid this...

```sh
sudo add-apt-repository ppa:ubuntu-x-swat/x-updates
sudo apt-get update
sudo apt-get upgrade
```

Then carry on...

```sh
sudo apt-get build-dep xserver-xorg-video-intel
sudo apt-get source xserver-xorg-video-intel
cd xserver-xorg-video-intel-2.17.0
sudo wget https://raw.github.com/liskin/patches/master/hacks/xserver-xorg-video-intel-2.18.0_virtual_crtc.patch
sudo patch -p1 < xserver-xorg-video-intel-2.18.0_virtual_crtc.patch
sudo dpkg-buildpackage -b
cd ..
sudo dpkg --install xserver-xorg-video-intel_2.19.0-0ubuntu1~xup1_amd64.deb
sudo reboot
```

### Check that Intel driver has been patched

When you run the following command you should see two displays listed, one of them will be named VIRTUAL.

```sh
xrandr
```

### Install `hybrid-screenclone`

```sh
sudo apt-get install git xorg-dev
git clone git://github.com/liskin/hybrid-screenclone.git
cd hybrid-screenclone
sudo make
sudo cp screenclone /usr/bin/
sudo chmod +x /usr/bin/screenclone
sudo cp xorg.conf.nvidia /etc/bumblebee/xorg.conf.nvidia
sudo rm /etc/X11/xorg.conf
```

### Edit `/etc/bumblebee/bumblebee.conf`

```sh
sudo nano /etc/bumblebee/bumblebee.conf
```

with these changes...

```
Driver=nvidia
KeepUnusedXServer=true
PMMethod=none
```


### Run `xrandr`, `optirun` and `screenclone` to get triple monitors

@todo cvrt Modeline thing
@todo Put into a script

```sh
xrandr --output LVDS1 --auto \
       --output HDMI1 --mode 1920x1080 --right-of LVDS1 \
       --output VIRTUAL --mode 2980x1080 --right-of HDMI1
optirun screenclone -d :8 -x 2
```

### Hold `xserver-xorg-video-intel`

Hold the xserver-xorg-video-intel package so that the patched version does not get updated over

```sh
sudo -s
echo xserver-xorg-video-intel hold | dpkg --set-selections
sudo apt-get update
sudo apt-get upgrade
```
