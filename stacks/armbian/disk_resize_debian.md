#qemu-img resize debian.qcow2 +5G

## debian系列里

nano /etc/fstab 
注销swap分区

fisk -lu /dev/sda

fdisk /dev/sda

root@debian11:~# fdisk /dev/sda

Welcome to fdisk (util-linux 2.38.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

GPT PMBR size mismatch (41041919 != 51527679) will be corrected by write.
The backup GPT table is not on the end of the device. This problem will be corrected by write.
This disk is currently in use - repartitioning is probably a bad idea.
It's recommended to umount all file systems, and swapoff all swap
partitions on this disk.


Command (m for help): p

Disk /dev/sda: 24.57 GiB, 26382172160 bytes, 51527680 sectors
Disk model: QEMU HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 6F09F896-CC41-47CB-BF4B-5B212543B8C8

Device       Start      End  Sectors  Size Type
/dev/sda1     2048  1050623  1048576  512M EFI System
/dev/sda2  1050624 41039871 39989248 19.1G Linux filesystem

Command (m for help): d
Partition number (1,2, default 2): 2

Partition 2 has been deleted.

Command (m for help): n
Partition number (2-128, default 2):
First sector (1050624-51527646, default 1050624):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (1050624-51527646, default 51525631):

Created a new partition 2 of type 'Linux filesystem' and of size 24.1 GiB.
Partition #2 contains a ext4 signature.

Do you want to remove the signature? [Y]es/[N]o: n

Command (m for help): w

The partition table has been altered.
Syncing disks.


partprobe

resize2fs
