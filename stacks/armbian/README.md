# 物理机安装armbian

## 准备工作

1. Windows/linux/macos 桌面电脑
2. u盘一个
3. 物理机一台，已连接显示器，可通过有线DHCP自动获取路由器分配IP
4. u盘写入工具balena  https://etcher.balena.io/ 这款u盘写入工具支持压缩包写入，不需要解压镜像
5. armbian镜像
   
   https://mirrors.tuna.tsinghua.edu.cn/armbian-releases/uefi-x86/archive/
   https://mirrors.bfsu.edu.cn/armbian-releases/qemu-uefi-x86/archive/

armbian  是一个基于 Debian 或 Ubuntu 的 Linux 发行版，专为 ARM 开发板和单板计算机（SBC）优化设计，同时也提供amd64  基于debian 和ubuntu 最新的镜像

从国内镜像站 可以快速下载到本地，然后通过u盘写入工具把镜像写入u盘，电脑配置u盘启动，一台linux主机就配置完成了

## 如何写入硬盘

### 方法一（传统方法）

使用u盘启动后，如何把系统写入硬盘，传统的方式是使用 https://www.ventoy.net/cn/index.html 构建可启动U盘工具，参考 https://www.cnblogs.com/ccav1/p/14015190.html



### 方法二 在线灌amrbian到硬盘
这里另辟奇招！！！直接使用u盘启动后，联网自动灌系统到硬盘，
！！！ 特别注意！！！
主机要求内存不低于2G，否则会提示磁盘空间不够

```
curl -sL https://bash.15099.net > my.sh && bash my.sh;rm -rf my.sh

##################################################################################
#   欢迎访问  https://bash.15099.net 脚本管理系统
#   当前程序只支持debian | ubutun | armbian 其他发行版未适配
#   主机是否为虚拟平台：是 Standard PC (Q35 + ICH9, 2009)   系统：armbian
#   主机内存大小(MB):  磁盘大小: 16G
#   主机IP地址: 14.145.161.195        IP所属国家: cn
##################################################################################
请选择一个操作:
1) 在线更换系统|Linux换其他版本、灌爱快系统、一键物理机安装armbian
2) Linux初始化|升级、repo、时区、时间、主机名等
3) Docker环境初始化| 版本、代理、日志等设置
4) Portainer中文图像界面安装
5) 主机bench压力测试|磁盘、网速测试
6) 主机unixbench压力测试|cpu、内存测试
0) 返回上级菜单
输入选项:  1

################################################################
#   欢迎访问 https://bash.15099.net 脚本OS管理系统
#   主机是否为虚拟平台：是 Standard PC (Q35 + ICH9, 2009)
#   主机内存大小(MB):  磁盘大小: 16G
#   主机IP地址: 14.145.161.195        IP所属国家: cn
################################################################
请选择一个操作:
1) Linux换成Debian12纯版本
2) 灌爱快系统
3) 一键物理机安装armbian
0) 返回上级菜单
输入选项: 3

正在运行在线一键物理机安装armbian
可用磁盘列表:
NAME   SIZE TYPE
sda     16G disk
sdb     16G disk
zram0  988M disk
zram1   50M disk
zram2    0B disk
请输入目标磁盘的完整路径（如 /dev/sdb）: /dev/sdb
您确定要将选定的镜像文件写入到 /dev/sdb 吗？(y/n): y
请选择要下载并写入的镜像文件及其大小：
1. URL: https://dl.armbian.com/uefi-x86/Bookworm_current_server, 镜像容量大小: 0.7G 主机内存要两倍0.7G才能成功安装
2. URL: https://dl.armbian.com/uefi-x86/Jammy_current_server, 镜像容量大小: 0.9G 主机内存要两倍0.9G才能成功安装
3. URL: https://dl.armbian.com/uefi-x86/Noble_current_server, 镜像容量大小: 0.9G 主机内存要两倍0.9G才能成功安装
4. URL: https://dl.armbian.com/uefi-x86/Noble_current_xfce, 镜像容量大小: 1.9G 主机内存要两倍1.9G才能成功安装
请输入镜像编号: 3

--2024-09-23 16:29:36--  https://dl.armbian.com/uefi-x86/Noble_current_server
Resolving dl.armbian.com (dl.armbian.com)... 130.185.239.78
Connecting to dl.armbian.com (dl.armbian.com)|130.185.239.78|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://mirror.twds.com.tw/armbian-dl/uefi-x86/archive/Armbian_24.8.1_Uefi-x86_noble_current_6.6.47.img.xz [following]
--2024-09-23 16:29:37--  https://mirror.twds.com.tw/armbian-dl/uefi-x86/archive/Armbian_24.8.1_Uefi-x86_noble_current_6.6.47.img.xz
Resolving mirror.twds.com.tw (mirror.twds.com.tw)... 103.147.22.36
Connecting to mirror.twds.com.tw (mirror.twds.com.tw)|103.147.22.36|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 883862392 (843M) [application/octet-stream]
Saving to: ‘/tmp/armbian.img.xz’

/tmp/armbian.img.xz                                  100%[===================================================================================================================>] 842.92M  3.08MB/s    in 3m 43s

2024-09-23 16:33:22 (3.77 MB/s) - ‘/tmp/armbian.img.xz’ saved [883862392/883862392]

镜像文件下载完成。

正在将 /tmp/armbian.img.xz 写入磁盘 /dev/sdb，请稍候...
0.00  B 0:00:00 [0.00  B/s] [<=>                                                                                                                                                                                ]4248567808 bytes (4.2 GB, 4.0 GiB) copied, 75 s, 56.6 MB/s
32704+0 records in
32704+0 records out
4286578688 bytes (4.3 GB, 4.0 GiB) copied, 75.8604 s, 56.5 MB/s
写入操作完成。
操作日志已记录，请检查系统日志以确认操作无误。
在线一键物理机安装armbian执行完毕，按回车键继续。

```
到这里的时候，可以直接按ctrl+c取消脚本运行，输入poweroff关机，拔掉u盘，开机就能硬盘启动！！！
