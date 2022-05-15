losetup /dev/loop8 $1
losetup /dev/loop9 $2
size1=$(blockdev --getsz /dev/loop8)
size2=$(blockdev --getsz /dev/loop9)
dmsetup create my-backup << EOF
0 $size1 linear /dev/loop8 0
$size1 $size2 linear /dev/loop9 0
EOF

#mknod /dev/sdb b 7 500
#losetup /dev/sdb virtual_hard_drive.bin
#mouunt /dev/sdb /mnt
