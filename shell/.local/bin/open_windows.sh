#!/bin/sh

virsh --connect qemu:///system start win11
sleep 30
xfreerdp3 -grab-keyboard /v:192.168.122.241 /u:lukas /p:ABCabc123 /size:100% /d: /dynamic-resolution
