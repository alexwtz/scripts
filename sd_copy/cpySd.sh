#!/bin/bash
echo "Please remove the sd card you want to copy and press enter"
count=0
while : ; do
read -n 1 k <&1
((count=$count+1))
if [[ $count -eq 1 ]]; then
#df -h > tmp1
sudo fdisk -l > tmp1
echo "Press enter when the sd card is plugged"
elif [[ $count -eq 2 ]]; then
#df -h > tmp2
sudo fdisk -l > tmp2
disk=$(diff -u tmp1 tmp2 | grep -oP '\+\K\/\D*' | sort -u)
echo "*** To copy the sdcard ***"
echo "sudo dd if=$disk of=sd_backup.img"
echo ""
echo "*** To write the sdcard ***"
echo "sudo umount $disk*"
echo "sudo dd if=sd_backup.img of=$disk"
break
fi
done

