#!/bin/sh

if [ $# -le 1 ] || [ $1 = '-h' ]
then
	echo "Usage: night-mode [on/off] [brightness 0-1]"
	exit 0
elif [ $1 = 'on' ]
then
	for disp in $(xrandr | grep 'connected' | cut -d ' ' -f1); do 
		xrandr --output $disp --gamma 0.9:0.85:0.7 --brightness $2
	done
	exit 0
elif [ $1 = 'off' ]
then
	for disp in $(xrandr | grep 'connected' | cut -d ' ' -f1); do
		xrandr --output $disp --gamma 1:1:1 --brightness $2
	done
	exit 0
else
	echo "Wrong arguments provided! Type night-mode -h for help."
	exit 0
fi
