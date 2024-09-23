## wifi连接
```
nmcli device wifi list
nmcli device wifi connect "Wi-Fi名称" password "密码"

nmcli device set wlp9s0 autoconnect yes
```
成功连接后按下面修改

```
cat /etc/NetworkManager/system-connections/406_5G.nmconnection
[connection]
id=406_5G
uuid=bfa5402e-9d94-406a-ace0-e42c758b8964
type=wifi
interface-name=wlp9s0
autoconnect=yes     <- 添加自动连接
wifi.powersave = 2  <- 添加禁止休眠
```
为了防止没有数据网络断开，添加定时ping 路由器

```
echo '*/10 * * * * ping 192.168.2.254 -c 1' >>/var/spool/cron/crontabs/root
```
