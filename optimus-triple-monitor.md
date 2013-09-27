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
```

Reboot

### Patch `xserver-xorg-video-intel`

Apply [liskin's patch](https://github.com/liskin/patches/blob/master/hacks/xserver-xorg-video-intel-2.18.0_virtual_crtc.patch) 
so that the Intel Graphics Driver supports a VIRTUAL display which will be `screenclone`d to the NVidia card.

```sh
sudo apt-get build-dep xserver-xorg-video-intel
sudo apt-get source xserver-xorg-video-intel

```

Reboot

### Check that Intel driver has been patched

When you run the following command you should see two displays listed, one of them will be named VIRTUAL.

```sh
xrandr
```

### Install `hybrid-screenclone`

```sh
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

```
Driver=nvidia
KeepUnusedXServer=true
PMMethod=none
```



