#!/bin/bash
# Show NVIDIA GPU power usage in watts

power=$(nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits 2>/dev/null | awk '{printf "%.0fW", $1}')
temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits 2>/dev/null)
util=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null)

if [ -n "$power" ]; then
    echo " 󰘚 ${power} ${util}% ${temp}°C"
else
    echo " 󰢮 N/A"
fi
