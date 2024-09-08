# 10.8.3 爱快添加Docker插件Clash容器分流

**目录**

一 下载镜像到爱快1

二 添加容器1

三 配置容器1

3.1 设备操作指南1

3.1.1添加订阅信息1

3.1.2 重启容器1

3.1.3 刷新游览器界面，检查IP是否生效1

3.1.4 导航到【网络设置】【VPN客户端】添加一条L2TP连接1

3.1.5 导航到【流控分流】【端口分流】添加一个客户端进行分流1

3.1.6 调整代理全局还是国内外分流1

3.2 游览器指南1

3.2.1添加订阅信息1

3.2.2 重启容器1

3.2.3 刷新游览器界面，检查IP是否生效1

3.2.4 游览器添加本地代理账号1

3.2.5 调整代理全局还是国内外分流1

## 一 下载镜像到爱快

方法1：离线上传安装

```shell
docker pull lihaixin/vpnikuai:clash
docker save lihaixin/vpnikuai:clash  -o clash.tar
python3 -m http.server


```

然后下载到本地上传

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/c312a92b-9977-4c32-8832-7dbd0e4a9dfe.png)

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/f289d251-3e95-4a3f-844d-7421980500bb.png)

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/b0bc4bac-74e7-4d86-892e-df83ecbb516e.png)

方法2：在线市场安装

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/37bbe370-57c6-4e49-bd57-8ebe7830e427.png)

## 二 添加容器

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/8e88477f-7ea5-49fb-a259-81c289864446.png?x-oss-process=image/crop,x_0,y_0,w_927,h_606/ignore-error,1)

## 三 配置容器

进入对应容器控制台，根据终端提示操作，一般我们要不就是针对设备分流，或者游览器配置代理，下面分别演示：

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/e6af500d-0fb7-4e72-8ca6-8bef5f959126.png)

### 3.1 设备操作指南

#### 3.1.1添加订阅信息

输入 <proxyedit> 添加clash订阅信息

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/87639437-c110-4148-94fb-8c43a778b964.png)

#### 3.1.2 重启容器

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/7a90f2a6-3039-43a4-8402-65e3e8b494d0.png)

#### 3.1.3 刷新游览器界面，检查IP是否生效

 输入 <proxyip> 检查是否显示的代理IP，如果不是，使用<proxylog>查看日志排查

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/b4412057-b835-49ee-bcd9-4cb9e05da699.png)

#### 3.1.4 导航到【网络设置】【VPN客户端】添加一条L2TP连接

添加一条L2TP VPN客户端，然后保存

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/922f3735-6871-48b2-8622-7e411f220c45.png)

刷新页面，看是否成功拨号

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/54fe0bb5-d912-43a4-af6f-4a5484dd8375.png)

#### 3.1.5 导航到【流控分流】【端口分流】添加一个客户端进行分流

添加一条端口分流，在源地址填写你需要分流的本地IP,在线路选择你需要走的线路

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/b7f0e284-5e07-4f90-8abd-83b8cfa2b868.png)

添加后类似下图

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/afecdd14-df24-4cee-bff0-f75576b106c8.png)

#### 3.1.6 调整代理全局还是国内外分流

默认是国内外分流，如果你要调整成全局代理，就是分流的设置访问国内外都使用代理，打开游览器输入[http://172.18.7.0:9090/ui](http://172.18.7.0:9090/ui)，地址记得改为容器IP地址

然后再设置选项卡，点击全局

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/b84e95bd-f823-453e-9eda-6a0cfb14ebf7.png)

然后切花到代理选项卡，点击PROXY

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/f99e3f18-bf6d-4d72-9534-2c0fef3bedcd.png)

返回到终端，再次验证访问国内外都是使用代理了

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/6b842fbe-4523-48bd-a9db-dbf569e2c06f.png)

你也可以通过分流设备打开游览器访问下面网址进行检查

[https://ip125.com/](https://ip125.com/) 

[http://ip111.cn/](http://ip111.cn/)

[http://ip100.info/](http://ip100.info/)

### 3.2 游览器指南

#### 3.2.1添加订阅信息

输入 <proxyedit> 添加clash订阅信息

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/87639437-c110-4148-94fb-8c43a778b964.png)

#### 3.2.2 重启容器

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/7a90f2a6-3039-43a4-8402-65e3e8b494d0.png)

#### 3.2.3 刷新游览器界面，检查IP是否生效

输入 <proxyip> 检查是否显示的代理IP，如果不是，使用<proxylog>查看日志排查

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/b4412057-b835-49ee-bcd9-4cb9e05da699.png)

#### 3.2.4 游览器添加本地代理账号

可以使用市面上的指纹游览器进行测试

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/584a31bf-587e-4ed1-9c23-a6cfa2abf86a.png)

#### 3.2.5 调整代理全局还是国内外分流

默认是国内外分流，如果你要调整成全局代理，就是分流的设置访问国内外都使用代理，打开游览器输入[http://172.18.7.0:9090/ui](http://172.18.7.0:9090/ui)，地址记得改为容器IP地址

然后再设置选项卡，点击全局

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/b84e95bd-f823-453e-9eda-6a0cfb14ebf7.png)

然后切花到代理选项卡，点击PROXY

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/f99e3f18-bf6d-4d72-9534-2c0fef3bedcd.png)

返回到终端，再次验证访问国内外都是使用代理了

![image.png](https://alidocs.oss-cn-zhangjiakou.aliyuncs.com/res/QvjnAkvY9MxyOXo5/img/6b842fbe-4523-48bd-a9db-dbf569e2c06f.png)

你也可以通过指纹游览器访问下面网址进行检查

1.   [https://ip125.com/](https://ip125.com/) 
    
2.  [http://ip111.cn/](http://ip111.cn/)
    
3.  [http://ip100.info/](http://ip100.info/)
    

## 参考资料

1. [https://lancellc.gitbook.io/clash](https://lancellc.gitbook.io/clash)

2. [https://github.com/Dreamacro/clash/wiki](https://github.com/Dreamacro/clash/wiki)

3. [https://github.com/Dreamacro/clash-dashboard](https://github.com/Dreamacro/clash-dashboard)

4. [https://github.com/haishanh/yacd](https://github.com/haishanh/yacd)

5. 自动更新脚本 [https://github.com/AoEiuV020/rc/blob/master/linux/clash/update.sh](https://github.com/AoEiuV020/rc/blob/master/linux/clash/update.sh)

6. 订阅 [https://hub.docker.com/r/stilleshan/sub](https://hub.docker.com/r/stilleshan/sub)

7. [https://stash.wiki/en](https://stash.wiki/en)

8. [https://wiki.metacubex.one/](https://wiki.metacubex.one/)
