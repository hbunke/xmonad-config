import XMonad
import XMonad.Util.EZConfig (additionalKeys)
--import XMonad.Hooks.DynamicLog (xmobar)
import XMonad.Hooks.DynamicLog
import qualified XMonad.StackSet as W


main = xmonad  =<< xmobar myConfig

myConfig = defaultConfig
    {
       terminal = "roxterm"
	  ,modMask = mod1Mask
      ,borderWidth = 3
--    ,   layoutHook = 
      ,logHook = dynamicLog
      ,startupHook = myStartupHook
      ,manageHook = myManageHook
      ,focusedBorderColor = myFocusedBorderColor
    }

    `additionalKeys`
    [ ((mod1Mask, xK_F1), spawn "firefox")
        ,((mod1Mask, xK_F2), spawn "chromium")
        ,((mod1Mask, xK_F3), spawn "firefox --new-window https://mailbox.org")
        ,((mod1Mask, xK_F4), kill)
        ,((mod1Mask, xK_Right), windows W.focusDown)
        ,((mod1Mask, xK_Left), windows W.focusUp)
    ]

-- dark material green
myFocusedBorderColor = "#009688"

-- pastell red
--myFocusedBorderColor="#DCA3A3"

-- material orange
--myFocusedBorderColor = "#F57900"

--materialbox neutral red
-- myFocusedBorderColor = "e53935"

myManageHook = composeAll 
   [ role =? "pop-up" --> doFloat ]
   where
    role = stringProperty "WM_WINDOW_ROLE"


myStartupHook = do
    spawn "$HOME/bin/xrandr.sh"
    spawn "$HOME/bin/trayer.sh"
    spawn "telegram-desktop"
    spawn "dropbox"
    spawn "pnmixer"


