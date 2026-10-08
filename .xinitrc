# keyboard settings
setxkbmap pl
setxkbmap -option caps:escape
xmodmap -e "keycode 9 = NoSymbol"
xset r rate 300 50

# Lock screen after 900s
xset s 900
xset +dpms
xset dpms 900 900 900

# start X session services
systemctl --user start x-session.target

exec dwm
