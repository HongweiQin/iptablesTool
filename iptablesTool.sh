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
