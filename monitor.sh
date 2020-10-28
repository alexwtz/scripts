#!/bin/sh

#pgrep -l '^dd$'

#2188 is the pid of the dd process

#kill -USR1 2188

cmd=$(pgrep -l '^dd$' | grep -oP '\K\d*')

watch -n 60 kill -USR1  $cmd
