import XMonad
import XMonad.Util.EZConfig (additionalKeys)
--import XMonad.Hooks.DynamicLog (xmobar)
import XMonad.Hooks.DynamicLog
import qualified XMonad.StackSet as W
-- import XMonad.Layout.NoFrillsDecoration
-- import XMonad.Config.Xfce

-- LAYOUTS:
-- import XMonad.Layout.Grid
-- import XMonad.Layout.Cross
-- import XMonad.Layout.ThreeColumns


main = xmonad  =<< xmobar myConfig


-- myLayoutHook = ThreeCol

myConfig = defaultConfig
--   myConfig = xfceConfig
    {
       terminal = "roxterm"
	  ,modMask = mod1Mask
      ,borderWidth = 3
--      ,layoutHook = myLayoutHook
      ,logHook = dynamicLog
      ,startupHook = myStartupHook
      ,manageHook = myManageHook
      ,focusedBorderColor = myFocusedBorderColor
    }

    `additionalKeys`
    [ ((mod1Mask, xK_F1), spawn "google-chrome-stable")
        ,((mod1Mask, xK_F2), spawn "firefox")
        ,((mod1Mask, xK_F3), spawn "brave")
        ,((mod1Mask, xK_F4), kill)
        ,((mod1Mask, xK_Right), windows W.focusDown)
        ,((mod1Mask, xK_Left), windows W.focusUp)
        ,((mod1Mask, xK_p), spawn "dmenu_run -fn 'Roboto-12'")
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
    spawn "$HOME/.xmonad/xrandr.sh"
    spawn "$HOME/.xmonad/trayer.sh"
    --spawn "telegram-desktop"
    spawn "feh --bg-fill ~/Dropbox/Wallpaper/Flowerbed.jpg"
 --   spawn "signal-desktop"
    spawn "dropbox"
    spawn "pnmixer"

-- myLayoutHook = noFrillsDeco shrinkText def (layoutHook def)

