# 
# Copyright (C) 2016 Hongwei Qin
#

# This file is part of iptablesTool.
#
# iptablesTool is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# iptablesTool is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with iptablesTool.  If not, see <http://www.gnu.org/licenses/>.
 
#!/bin/bash

# Declair variables
$goon

$Wname      #WAN's name
$WIP
$Lname      #LAN's name
$LIP
$SIP        #LAN Server's IP
$Sport      #LAN Server's port
$Wport      #WAN's port


# Load configurations
source ./Config

# Declair functions
function init()
{
	touch $TMP_FILE
}

function ask()
{
echo $1
printf "==>"
}

function write2tmp()
{
echo $1 >> $TMP_FILE
}

function fhelp()
{
echo "portMap - map a LAN server port to a WAN port"
echo "export - export current commands to a file"
echo "show - show commands in temp file"
echo "? - print out available commands"
echo "quit - Exit program"
}

function fshow()
{
cat $TMP_FILE
}

function fpmap()
{
	ask "What's your WAN's name?"
	read Wname
	ask "What's your WAN's IP?"
	read WIP
	ask "What's your LAN's name?"
	read Lname
	ask "What's your LAN's IP?"
	read LIP
	ask "What's your LAN Server's IP?"
	read SIP
	ask "What's your LAN Server's port to map?"
	read Sport
	ask "Which WAN port will the LAN server map to?"
	read Wport
	write2tmp "iptables -t nat -A PREROUTING -p tcp -d "$WIP" --dport "$Wport" -j DNAT --to-destination "$SIP":"$Sport
	write2tmp "iptables -a INPUT -i "$Wname" -p tcp --dport "$Wport" -m state --state NEW,ESTABLISHED -j ACCEPT"
	write2tmp "iptables -a OUTPUT -o "$Wname" -p tcp --sport "$Wport" -m state --state ESTABLISHED -j ACCEPT"
	echo "Done."
}

function byebye()
{
rm $TMP_FILE
goon=0
}

# End of function declairations

# Here we go!
init ;
echo "Welcome to use iptables tool!"
echo "type ? for help"
goon=1
while (($goon))
do
	printf "==>"
	read cmd
 	case $cmd in
		'?') fhelp ;
		;;
		show) fshow ;
		;;
		portMap) fpmap ;
		;;
		quit) byebye ;
		;;
		*) echo "invalid command, type ? for help"
		;;
	esac
done
