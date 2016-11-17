#!/usr/bin/env bash
# Simple script to flush DNS cache on OSX
# Tested on Mac OS X - 10.11.6

# More info
# - http://osxdaily.com/2015/11/16/howto-flush-dns-cache-os-x-elcap/
# - https://coolestguidesontheplanet.com/clear-the-local-dns-cache-in-osx/

echo 'Flushing DNS Cache - mDNSResponder'
sudo killall -HUP mDNSResponder

echo 'Flush route'
sudo route -n flush
# repeat for better result
sudo route -n flush
sudo route -n flush

echo 'Restart networking'

echo 'Restart ethernet'
sudo ifconfig en0 down
sudo ifconfig en0 up

echo 'Restart wifi'
sudo ifconfig en1 down
sudo ifconfig en1 up

echo 'Done resetting network'

echo 'Flushing DNS Cache - dscacheutil'
sudo dscacheutil -flushcache
