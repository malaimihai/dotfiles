#!/bin/bash
# AMD CPU temperature (Tctl from k10temp)

temp=$(sensors | awk '/k10temp-pci-00c3/,/^$/{if($1=="Tctl:") print int($2)}')

if [ -n "$temp" ]; then
    echo "${temp}°C"
else
    echo "tmp N/A"
fi
