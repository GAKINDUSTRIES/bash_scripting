#!/bin/bash
#
# Simple cron creation
# Author: Guillermo Kuster

# Write out current crontab
crontab -l > tmp

#echo new cron into cron file,
echo "15 08 * * 1-7 echo hello >> ~/sample.log" >> tmp

#install new cron file
crontab tmp

#remove tmp file
rm tmp
