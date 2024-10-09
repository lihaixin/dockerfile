# clash

## 介绍

基于[mihomo](https://github.com/MetaCubeX/mihomo)和 [alpine](https://www.alpinelinux.org/) 构建的爱快多网关容器镜像，基于[portainer](https://hub.docker.com/r/lihaixin/portainer) 图形化管理，支持 arm64 和 amd64 架构，默认支持配置 socks5 http https 作为爱快分流下一条网关

先说一下爱快，是目前国内活跃度比较高的软路由器系统，优势在于分流功能强大和行为管控精准，同时提供企业级版本支持，2013 年推出 Q 系列性价比不错的 [Q3000](https://u.jd.com/hieTfAF) [Q6000](https://u.jd.com/hQeEpVI),支持 配置 8 条 SSID 无线热点，是外贸企业最佳的多落地 IP 解决方案

### 原理

爱快系统默认支持 l2tp openvpn pptp 这三款传统VPN 客户端，但不支持 vless vmess shadowsocks wireguard 新型的代理，也不支持 socks5 http https 这些传统的代理 IP，为了方便外贸企业、游戏工作室、tiktok 直播 便捷单设备单 IP ,使用容器技术，mihomo 多协议代理管理，构建网关，然后配合爱快分流走【下一跳网关】，达到单设备单IP 目的，且每个设备互相独立

### 优点

1.  各容器通过 macvlan 互相独立
    
2.  各 SSID\_BSSID 不同，网段独立，网关独立、DNS 也可以单独设置
    
3.  支持市面上大部分代理协议
    

## 方案

### 方案一（小白+小黑）

![011 爱快企业版外挂CPU.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/YdgOkx572mx3l4BX/img/3f897a4f-83d0-4184-99a1-3ef043f73343.png)![011 爱快企业版外挂CPU2.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/YdgOkx572mx3l4BX/img/451f9423-5d8b-41f3-9c8d-def45ef8e294.png)

接线按上图，方案也可以叫成大白+小黑，大白（爱快路由器）负责拨号上网和源地址分流，小黑（外挂小主机预装 portainer 中文界面）用于 协议转化，隧道加密构架多条网关

### 方案二（爱快软路由+linux 虚拟机）

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/YdgOkx572mx3l4BX/img/05a0f4b2-3bd9-4387-a113-9f74764f16c7.png?x-oss-process=image/crop,x_0,y_0,w_813,h_395/ignore-error,1)

按传统方式物理机部署爱快 64 位软路由+添加 armbian 虚拟机，爱快路由器负责拨号上网和源地址分流，armbian 虚拟机(安装 portainer 中文界面)用于 协议转化，隧道加密构架多条网关

选择 armbian 原因：官方提供现成的 qcow2 镜像文件，下载下来稍微配置就能用。

## 部署

直接通过 portainer 图像化操作，使用 stack 配置 

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/YdgOkx572mx3l4BX/img/d38bb1bc-06cf-47d4-a498-fb1541a24d14.png)

根据你的代理类型调整下面内容

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/YdgOkx572mx3l4BX/img/2fe828e4-3e01-438e-aef5-b04c704f18bf.png)

创建网关了，直接在爱快分流里添加下一跳网关
