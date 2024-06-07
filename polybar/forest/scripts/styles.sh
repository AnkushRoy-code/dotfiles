#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/forest/colors.ini"
RFILE="$HOME/.config/polybar/forest/scripts/rofi/colors.rasi"

# Change colors
change_color() {
	# polybar
	sed -i -e "s/background = #.*/background = $BG/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = $FG/g" $PFILE
	sed -i -e "s/sep = #.*/sep = $SEP/g" $PFILE
	
	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* {
	  al:   #00000000;
	  bg:   ${BG}FF;
	  bga:  ${BGA}FF;
	  fg:   ${FG}FF;
	  ac:   ${AC}FF;
	  se:   ${SE}FF;
	}
	EOF
	
	polybar-msg cmd restart
}

if  [[ $1 = "--default" ]]; then
	BG="#212B30"
	FG="#C4C7C5"
	BGA="#263035"
	SEP="#3F5360"
	AC="#EC407A"
	SE="#4DD0E1"
	change_color
elif  [[ $1 = "--nord" ]]; then
	BG="#3B4252"
	FG="#E5E9F0"
	BGA="#454C5C"
	SEP="#5B6579"
	AC="#BF616A"
	SE="#88C0D0"
	change_color
elif  [[ $1 = "--catppuccin" ]]; then
	BG="#24273A"
	FG="#CDD6F4"
	BGA="#6C7086"
	SEP="#7F849C"
	AC="#FAB387"
	SE="#F5E0DC"
	change_color
elif  [[ $1 = "--gruvbox" ]]; then
	BG="#282828"
	FG="#EBDBB2"
	BGA="#313131"
	SEP="#505050"
	AC="#FB4934"
	SE="#8EC07C"
	change_color
elif  [[ $1 = "--dark" ]]; then
	BG="#141C21"
	FG="#93A1A1"
	BGA="#1E262B"
	SEP="#3C4449"
	AC="#D12F2C"
	SE="#33C5BA"
	change_color
elif  [[ $1 = "--cherry" ]]; then
	# BG="#1F1626"
	BG="#3B4252"
	FG="#FFFFFF"
	BGA="#292030"
	# SEP="#473F4E"
	SEP="#5B6579"
	AC="#D94084"
	# SE="#4F5D95"
	SE="#88C0D0"
	change_color
else
	cat <<- _EOF_
	No option specified, Available options:
	--default  --catppuccin  --nord    --gruvbox    --dark    --cherry
	_EOF_
fi
