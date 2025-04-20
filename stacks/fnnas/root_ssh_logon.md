# 开启root ssh登录

```
sudo -i
sed -i s'/^PermitRootLogin no/PermitRootLogin yes/' /etc/ssh/sshd_config

```
# 一键生成root证书登录
```
# 本地复制 和修改权限，方便lihaixin/toolbox登录
ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa
cd .ssh
cp id_rsa.pub authorized_keys
chmod 600 authorized_keys

server ssh restart
```
# 添加ipvlan网络或者macvlan网络

我是无线网卡，网卡名称为：wlp9s0 所以添加ipvlan网络
```
docker network create -d ipvlan \
    --subnet=192.168.2.0/24 \
    --gateway=192.168.2.254 \
    --ip-range=192.168.2.1/28 \
    -o ipvlan_mode=l2 \
    -o ipvlan_flag=bridge \
    -o parent=wlp9s0 vlan
```
物理以太网卡，添加macvlan网络

```
docker network create -d macvlan \
  --subnet=192.168.2.0/24 \
  --gateway=192.168.2.254 \
  --ip-range=192.168.2.1/28 \
  -o macvlan_mode=bridge \
  -o parent=wlp9s0 vlan
```
