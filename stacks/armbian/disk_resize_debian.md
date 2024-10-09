# 如何调整debian11 虚拟机磁盘空间

## 宿主机操作

```
# 给qcow2磁盘添加5G空间
qemu-img resize debian.qcow2 +5G
```
## debian虚拟机里

```
# 注销swap分区,便于后续启动不加载swap分区，虚拟机里使用虚拟分区性能也不好，直接删除不用
nano /etc/fstab 
```
```
# 查看当前磁盘，看扩容的5G是否在磁盘有显示
fisk -lu /dev/sda
```

```
# 进入实际操作

root@debian12:~# fdisk /dev/sda               <-- 使用fdisk打开磁盘

Welcome to fdisk (util-linux 2.38.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

GPT PMBR size mismatch (41041919 != 51527679) will be corrected by write.
The backup GPT table is not on the end of the device. This problem will be corrected by write.
This disk is currently in use - repartitioning is probably a bad idea.
It's recommended to umount all file systems, and swapoff all swap
partitions on this disk.


Command (m for help): p                       <-- 查看当前分区

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

Command (m for help): d                      <-- 删除Linux filesystem 和swap分区
Partition number (1,2, default 2): 2         <--这里swap分区 以前删除了，直接输入2 ，删除Linux filesystem

Partition 2 has been deleted.

Command (m for help): n                      <--创建分区
Partition number (2-128, default 2):         <--创建2
First sector (1050624-51527646, default 1050624):   <--直接把剩余的扇区都给2
Last sector, +/-sectors or +/-size{K,M,G,T,P} (1050624-51527646, default 51525631):

Created a new partition 2 of type 'Linux filesystem' and of size 24.1 GiB.
Partition #2 contains a ext4 signature.

Do you want to remove the signature? [Y]es/[N]o: n   <-- 选择 “No”（N）比较安全，因为你并不想删除 ext4 文件系统的签名。这是为了确保当前的数据不被破坏

Command (m for help): w                              < --把上面调整的操作写入磁盘

The partition table has been altered.
Syncing disks.
```

```
# 运行下面命令
partprobe                                           <--命令刷新分区表
resize2fs /dev/sda2                                 <--扩展文件系统
df -h                                               <--可以看到/跟目录已经扩充了
                                   
