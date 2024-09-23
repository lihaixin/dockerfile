## wifi连接


```
nmcli device wifi list                               <-- 查看当前wifi信号信息
nmcli device wifi connect "Wi-Fi名称" password "密码" <--添加账号和密码
nmcli connection modify 406_5G 802-11-wireless.powersave disable  <- 添加禁止休眠
nmcli connection modify 406_5G autoconnect yes  <- 添加自动连接


nmcli device set wlp9s0 autoconnect yes  <--设置设备自动连接
```
成功连接后按下面修改

```

root@fnnas:~# cat /etc/NetworkManager/system-connections/406_5G.nmconnection
[connection]
id=****
uuid=bfa5402e-9d94-406a-ace0-e42c758b8964
type=wifi
interface-name=wlp9s0
timestamp=1726986785

[wifi]
mode=infrastructure
powersave=2   <- 添加禁止休眠
ssid=****

[wifi-security]
auth-alg=open
key-mgmt=wpa-psk
psk=******

[ipv4]
method=auto

[ipv6]
addr-gen-mode=default
method=auto

[proxy]
root@fnnas:~#
```

```
root@fnnas:~# nmcli connection show 406_5G | grep  -E 'save|auto'
connection.autoconnect:                 yes          <- 添加自动连接
connection.autoconnect-priority:        0
connection.autoconnect-retries:         -1 (default)
connection.autoconnect-slaves:          -1 (default)
802-11-wireless.mtu:                    auto
802-11-wireless.powersave:              2 (disable)  <- 添加禁止休眠
ipv4.method:                            auto
ipv4.ignore-auto-routes:                no
ipv4.ignore-auto-dns:                   no
ipv4.auto-route-ext-gw:                 -1 (default)
ipv6.method:                            auto
ipv6.ignore-auto-routes:                no
ipv6.ignore-auto-dns:                   no
ipv6.mtu:                               auto
ipv6.auto-route-ext-gw:                 -1 (default)
```
参考资料：https://gist.github.com/jcberthon/ea8cfe278998968ba7c5a95344bc8b55

为了防止没有数据网络断开，添加定时ping 路由器

```
echo '*/10 * * * * ping 192.168.2.254 -c 1' >>/var/spool/cron/crontabs/root
```
