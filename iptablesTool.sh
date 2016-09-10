#!/bin/bash
function fhelp()
{
echo "portMap - map a LAN server port to a WAN port"
echo "export - export current commands to a file"
echo "? - print out available commands"
echo "quit - Exit program"
}

function fshow()
{

}

function pmap()
{

}

echo "Welcome to use iptables tool!"
echo "type ? for help"
goon=1
while (($goon))
do
	printf "==>"
	read cmd
 	case $cmd in
		?) fhelp ;
		;;
		show) fshow ;
		;;
		portMap) fpmap ;
		;;
	esac
	break
done
