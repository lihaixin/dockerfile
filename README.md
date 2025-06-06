## 此容器作用

更新时间：2023-05-26


收集整理个人常用的容器镜像，添加到portainer模板里,方便快速部署

## Docker环境部署
参考 [https://bash.15099.net](https://bash.15099.net)


## 模板说明

提供两种模板方式，一种使用docker容器，一种使用docker stacks(compose)部署

1. 容器 使用docker 桥接和host部署网络【机房专用】,不支持自动创建volume，不方便卷存储数据
2. stacks 使用自定义桥接或者macvlan网络【内网专用】，自动创建volume，方便卷存储数据
   
   2.1 自定义桥接

   ```
   docker network create -d bridge \
    --subnet=172.19.0.0/24 \
    --gateway=172.19.0.254 \
   vlan
   ```
   2.2 macvlan网络
  
    ```
    docker network create -d macvlan \
    --subnet=172.19.0.0/24 \
    --gateway=172.19.0.254 \
    -o macvlan_mode=bridge \
    -o parent=eth0 vlan
    ```
   2.3 ipvlan网络(无线网卡)
  
    ```
    docker network create -d ipvlan \
    --subnet=172.19.0.0/24 \
    --gateway=172.19.0.254 \
    -o macvlan_mode=bridge \
    -o parent=eth0 vlan
    ```
## 所有的Docker 模板 
[官方模板格式](https://docs.portainer.io/advanced/app-templates/format#administrator-only)  [compose 格式](https://docs.docker.com/compose/compose-file/)  [官方模板案例](https://raw.githubusercontent.com/portainer/templates/master/templates-2.0.json)

### docker
|序号|容器名称|默认端口|地址|备注|
|:----|:----:|:----|:----|:----|
|docker-1|Registry|5000|[Registry](https://hub.docker.com/_/registry)|用于在portainer上便捷访问宿主机|
|docker-2|portainer|9000 9443 8000|[portainer](https://hub.docker.com/r/lihaixin/portainer)|用于创建宿主机docker图形化WEB管理界面|

### tools
|序号|容器名称|默认端口|地址|备注|
|:----|:----:|:----|:----|:----|
|tools-1|toolbox|无|[base](https://hub.docker.com/r/lihaixin/toolbox)|用于在portainer上便捷访问宿主机|
|tools-2|speedtest|80|[speedtest](https://hub.docker.com/r/lihaixin/speedtest)|用于创建提供宿主机在线测试网速的小工具|
|tools-3|vnstat|80|[vnstat](https://hub.docker.com/r/lihaixin/vnstat)|用于创建提供宿主机网络流量监视器,防止流量超额|
|tools-4|iptables|无|[iptables](https://hub.docker.com/r/lihaixin/iptables)|用于限制容器TCP最大连接数，最大带宽|
|tools-5|netdata|19999|[netdata](https://hub.docker.com/r/lihaixin/netdata)|用于创建提供宿主机性能监控工具|
|tools-6|lg|80|[looking-glass](https://hub.docker.com/r/lihaixin/looking-glass)|用于创建提供宿主机访问其他网络的小工具|

### cert 
|序号|容器名称|默认端口|地址|备注|
|:----|:----:|:----|:----|:----|
|cert-1|amce|无|[amce](https://hub.docker.com/r/lihaixin/amce)|用于创建域名数字证书|

### xray 
|序号|容器名称|默认端口|地址|备注|
|:----|:----:|:----|:----|:----|
| xray-1|xray|443 88|[xray](https://hub.docker.com/r/lihaixin/xray)|一键部署十三合一代理|
| xray-2|XRAY:MULTI|10801 20801 30801 |[xray:multi](https://hub.docker.com/r/lihaixin/xray/tags)|站群服务器（多IP服务器）一键部署|
| xray-3|x-ui|54321|[x-ui](https://hub.docker.com/r/lihaixin/x-ui)|一键部署xray图形化面板|

### gost
|序号|容器名称|默认端口|地址|备注|
|:----|:----:|:----|:----|:----|
| gost-1|https|58338|[gost:https](https://hub.docker.com/r/lihaixin/gost/tags)|一键部署https代理，外贸首选|
| gost-2|socks5|10021|[gost:s5](https://hub.docker.com/r/lihaixin/gost/tags)|一键部署socks5代理，支持批量中转，提供加速接口|
| gost-3|multi|10021|[gost:multi](https://hub.docker.com/r/lihaixin/gost/tags)|一键部署gost动态IP代理|
| gost-4|vpn-server|4096 8421|[gost:vpn.server](https://hub.docker.com/r/lihaixin/gost/tags)|一键部署gost国内外隧道|
| gost-5|vpn-client|4096 8421|[gost:vpn.client](https://hub.docker.com/r/lihaixin/gost/tags)|一键部署gost国内外隧道|

### ssh
|序号|容器名称|默认端口|地址|备注|
|:----|:----:|:----|:----|:----|
| ssh-1|webssh|8888|[webssh](https://hub.docker.com/r/lihaixin/webssh)|一键部署webssh客户端，支持证书登录|
| ssh-2|ttyd|7681|[ttyd](https://hub.docker.com/r/lihaixin/ttyd)|一键部署ttyd，支持rzsz文件传输|
| ssh-3|next-terminal|8088|[next-terminal](https://hub.docker.com/r/lihaixin/next-terminal)|一键部署下一代终端，支持ssh、rdp、vnc、telnet |

### vpn
|序号|容器名称|默认端口|地址|备注|
|:----|:----:|:----|:----|:----|
| vpn-1|ovpn|1723 1723 500 1701 4500 1194 5555 |[softether](https://hub.docker.com/r/lihaixin/softether)|一键部署 PPTP L2TP OPENVPN SSTP 服务器|
| vpn-2|ovpn:multi|1723 1723 500 1701 4500 1194 5555 |[softether:multi](https://hub.docker.com/r/lihaixin/softether/tags)|一键部署 PPTP L2TP OPENVPN SSTP 服务器|


### Reverse Proxy
|序号|容器名称|默认端口|地址|备注|
|:----|:----:|:----|:----|:----|
| RProxy-1|nps:s|80 443 8024 |[nps:s](https://hub.docker.com/r/lihaixin/nps)|一键部署NPS 内网穿透服务器|
| RProxy-2|nps:c|无 |[nps:c](https://hub.docker.com/r/lihaixin/nps)|一键部署NPS 内网穿透客户端|
| RProxy-3|frp:s|80 443 7500 |[frp:s](https://hub.docker.com/r/lihaixin/frp)|一键部署FRP 内网穿透服务器|
| RProxy-4|frp:c|无 |[frp:c](https://hub.docker.com/r/lihaixin/frp)|一键部署FRP 内网穿透客户端|
| RProxy-5|ghproxy|80 |[ghproxy](https://hub.docker.com/r/lihaixin/ghproxy)|一键部署反向代理github|
| RProxy-6|npm|80 81 443 |[npm](https://hub.docker.com/r/lihaixin/npm)|一键部署反向代理各类网站|
| RProxy-7| cache-docker|5000 |[cache-docker](https://hub.docker.com/_/registry)|一键部署反向代理hub.docker.com|

## 联系我

+V: Gsanjin01 记得注明来源
