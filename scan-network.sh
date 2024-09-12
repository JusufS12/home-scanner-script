#! /bin/sh

sudo netdiscover -PN -r 192.168.0.0/24 | sed '$d' > hosts.txt
cat hosts.txt
cat hosts.txt | awk -F " " '{print $1}' > hosts-raw-ip.txt
sudo nmap -O -iL hosts-raw-ip.txt > nmapscan.txt
echo "Finished! The results are in nmapscan.txt."
