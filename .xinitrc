# keyboard settings
setxkbmap -option caps:escape
xmodmap -e "keycode 9 = NoSymbol"
xset r rate 300 50

# compositor
picom --config ~/.config/picom.conf &
	
# other
slstatus &
dunst &

exec dwm
