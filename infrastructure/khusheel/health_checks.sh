#!/bin/bash


OUTPUT="system_health.txt"
>$OUTPUT

echo "### CPU Usage ###" >> $OUTPUT
top -bn1 | grep "Cpu(s)" >> $OUTPUT
echo "" >> $OUTPUT

echo "### Memory Usage ###" >> $OUTPUT
free -h >> $OUTPUT
echo "" >> $OUTPUT

echo "### Disk Usage ###" >> $OUTPUT
df -h >> $OUTPUT
echo "" >> $OUTPUT

echo "### Running Processes ###" >> $OUTPUT
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head >> $OUTPUT
echo "" >> $OUTPUT

echo "### Network Information ###" >> $OUTPUT
sudo netstat -pt >> $OUTPUT
echo "" >> $OUTPUT

echo "### System Uptime ###" >> $OUTPUT
uptime >> $OUTPUT
echo "" >> $OUTPUT

echo "Heath log is generated :$OUTPUT"

