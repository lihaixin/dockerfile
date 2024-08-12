version: '2'
services:                                    # 爱快虚拟机下配置多clash透明代理，然后给无线热点分流
 vwan:                                       # 修改服务名称 *  
    image: "ikuaiapp/clash"
    restart: unless-stopped                  # unless-stopped  always 
    privileged: true
    environment:
      QQ: "00015050999"
      CLASH_TYPE: M6_S5                            # M1_BMD 为白名单模式  M2_HMD为黑名单模式 M3_GFL 按国家分流负载均衡模式
      CLASH_MODE: global                           # rule / global / direct / (default is rule)
      RTYPE: socks5                                # 落地类型 支持socks5 和 http （链式中转模式下生效）
      RSERVER: 8.8.6.6                             # 落地IP （链式中转模式下生效）
      RPORT: 10800                                 # 落地代理端口 （链式中转模式下生效）
      RUSER: 000S5                                 # 落地代理账号 （链式中转模式下生效）
      RPASS: 000S5                                 # 落地代理密码 （链式中转模式下生效）

    networks:
      wan1:
        ipv4_address: 172.19.0.1                   # 修改不同的IP *
networks:
  wan1:
    name: 1macvlan
    driver: macvlan
    driver_opts:
      parent: eth0                                 # 对接虚拟机网卡名称，爱快内置的debian12虚拟机第一个网卡默认 ens3
    ipam:
      config:
        - subnet: 172.19.0.0/16                     # 局域网网段范围
          gateway: 172.19.0.254                     # 局域网网关
