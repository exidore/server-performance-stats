#!/bin/bash
 
echo "===== SERVER PERFORMANCE STATS ====="
 
# CPU Usage

echo -e "\n[CPU USAGE]"

top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}'
 
# Memory Usage

echo -e "\n[MEMORY USAGE]"

free -h

echo

free | awk '/Mem:/ {

  used=$3; free=$4; total=$2; 

  used_percent=(used/total)*100; 

  printf("Memory Used: %dMB / %dMB (%.2f%%)\n", used/1024, total/1024, used_percent)

}'
 
# Disk Usage

echo -e "\n[DISK USAGE]"

df -h --total | grep total
 
# Top 5 processes by CPU

echo -e "\n[TOP 5 PROCESSES BY CPU USAGE]"

ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6
 
# Top 5 processes by Memory

echo -e "\n[TOP 5 PROCESSES BY MEMORY USAGE]"

ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6
 
# Stretch Goals

echo -e "\n[EXTRA INFO]"

echo "OS Version: $(uname -a)"

echo "Uptime: $(uptime -p)"

echo "Load Average: $(uptime | awk -F'load average:' '{ print $2 }')"

echo "Logged in users:"

who

echo -e "\nFailed login attempts (last 20):"

lastb | head -n 20

 
