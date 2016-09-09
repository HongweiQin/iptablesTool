#!/bin/bash
echo "Welcome to use iptables tool!"
echo "type ? for help"
goon=1
while (($goon))
do
	printf "==>"
	read cmd
 	case $cmd in
		?) echo "in=1"
		;;
		show) echo "in=2"
		;;
		portMap) echo "in=ss"
		;;
	esac
	break
done
