#!/bin/bash

# Get current date and time
now=$(date +"%Y-%m-%d %H:%M:%S")

# Get top 5 processes by CPU usage
cpu_procs=$(ps aux --sort=-%cpu | head -n 6)

# Get top 5 processes by memory usage
mem_procs=$(ps aux --sort=-%mem | head -n 6)

# Print highlights to console
echo "System resource usage at $now:"
echo ""
echo "Top 5 processes by CPU usage:"
echo "$cpu_procs"
echo ""
echo "Top 5 processes by memory usage:"
echo "$mem_procs"
