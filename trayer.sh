#!/bin/sh

#trayer starts again each time xmonad restart, which is not what we want. So
#this checks if trayer is already running and if not starts it

CMD= trayer --align right --widthtype pixel --width 75 --monitor 0 --height 21 --transparent true --alpha 0 --tint 0x000000 &

if [ -z "$(pgrep trayer)" ]
    then $CMD
fi
