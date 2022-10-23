## 构建

```
#docker buildx create --use --name=mybuilder-cn --driver docker-container --driver-opt image=dockerpracticesig/buildkit:master
docker run --rm --privileged tonistiigi/binfmt:latest --install all
docker buildx create --name mybuilder --driver docker-container
docker buildx use mybuilder
docker buildx build --platform linux/arm64,linux/amd64 -t lihaixin/gost:vpn.s . --push
docker buildx build -f Dockerfile.3.14 --platform linux/arm64,linux/amd64 -t lihaixin/gost:vpn.s --push
```

## 联系我

[点击call me](./contactme.md)

## 所有的Docker 模板

### coker
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


