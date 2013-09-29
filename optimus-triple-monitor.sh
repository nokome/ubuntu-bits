# Create a mode for an extra wide VIRTUAL screen
# I arrived at 2944 width purely through trial and error
modeline=`cvt 2944 1080 | sed "1d" | sed 's/Modeline //'`
modename=`echo $modeline | sed 's/ .*//'`
# Create the mode (ignoring xrandr error if the mode is already there)
xrandr --newmode $modeline &> /dev/null 2>&1
# Add the mode to VIRTUAL
xrandr --addmode VIRTUAL $modename

# Configure screen size and placements
# Note that on the Dell XPS L502X, HDMI1 is actually the DisplayPort output and VIRTUAL is the HDMI output
# Note that the width of the screen (---fb) is one pixel less than the combined widths.
# xrandr complains about this but, at the correct width, the configuration does not work
xrandr --fb 6229x1080 \
       --output VIRTUAL --mode $modename --pos 0x0 \
       --output HDMI1 --mode 1920x1080 --pos 2944x0 \
       --output LVDS1 --mode 1366x768 --pos 4864x312
       
       
# Run screen clone using the Bumblebee client `optirun`
optirun screenclone -d :8 -x 2
