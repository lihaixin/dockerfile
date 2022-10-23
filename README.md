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

### tools
|序号|容器名称|默认端口|地址|备注|
|:----|:----:|:----|:----|:----|
|tools-1|toolbox|无|[base](https://hub.docker.com/r/lihaixin/toolbox)|用于在portainer上便捷访问宿主机|
|tools-2|speedtest|80|[speedtest](https://hub.docker.com/r/lihaixin/speedtest)|用于创建提供宿主机在线测试网速的小工具|
|tools-3|vnstat|80|[vnstat](https://hub.docker.com/r/lihaixin/vnstat)|用于创建提供宿主机网络流量监视器,防止流量超额|
|tools-4|iptables|无|[iptables](https://hub.docker.com/r/lihaixin/iptables)|用于限制容器TCP最大连接数，最大带宽|
|tools-5|netdata|19999|[netdata](https://hub.docker.com/r/lihaixin/netdata)|用于创建提供宿主机性能监控工具|
|tools-6|lg|19999|[looking-glass](https://hub.docker.com/r/lihaixin/looking-glass)|用于创建提供宿主机访问其他网络的小工具|

### cert 
|序号|容器名称|默认端口|地址|备注|
|:----|:----:|:----|:----|:----|
|cert-1|amce|无|[amce](https://hub.docker.com/r/lihaixin/amce)|用于创建域名数字证书|

### xray 
|序号|容器名称|默认端口|地址|备注|
|:----|:----:|:----|:----|:----|
| xray-1|xray|443 88|[xray](https://hub.docker.com/r/lihaixin/xray)|一键部署十三合一代理|
| xray-1|x-ui|54321|[x-ui](https://hub.docker.com/r/lihaixin/x-ui)|一键部署xray图形化面板|

### gost
|序号|容器名称|默认端口|地址|备注|
|:----|:----:|:----|:----|:----|
| gost-1|xray|443 88|[xray](https://hub.docker.com/r/lihaixin/xray)|一键部署十三合一代理|
| gost-1|x-ui|54321|[x-ui](https://hub.docker.com/r/lihaixin/x-ui)|一键部署xray图形化面板|
