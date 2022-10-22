# 构建

```
#docker buildx create --use --name=mybuilder-cn --driver docker-container --driver-opt image=dockerpracticesig/buildkit:master
docker run --rm --privileged tonistiigi/binfmt:latest --install all
docker buildx create --name mybuilder --driver docker-container
docker buildx use mybuilder
docker buildx build --platform linux/arm64,linux/amd64 -t lihaixin/gost:vpn.s . --push
docker buildx build -f Dockerfile.3.14 --platform linux/arm64,linux/amd64 -t lihaixin/gost:vpn.s --push
```

# 联系我

![https://raw.githubusercontent.com/lihaixin/dockerfile/master/logo/weixin.png](https://raw.githubusercontent.com/lihaixin/dockerfile/master/logo/weixin.png)

## 所有的Docker 模板

## net
- [base](../../../base)
- [tools](../../../tools)
- [polipo](../../../polipo)
- [pptpd](../../../pptpd)
- [speedtest](../../../speedtest)
- [shadowsocksr](../../../shadowsocksr)
- [shadowsocks](../../../shadowsocks)
- [brook](../../../brook)
- [chinadns](../../../chinadns)
- [fteproxy](../../../fteproxy)
- [iptables](../../../iptables)
- [n2n](../../../n2n)
- [ntopng](../../../ntopng)
- [portainer](../../../portainer)
- [softether](../../../softether)
- [vnstat](../../../vnstat )
- [pac](../../../pac )   在线pac代理
