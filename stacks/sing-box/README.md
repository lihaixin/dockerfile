## compose

```
services:
  singbox:
    image: lihaixin/sing-box
    restart: unless-stopped
    cap_add:
      - NET_ADMIN
    devices:
      - /dev/net/tun:/dev/net/tun
    privileged: true
    environment:
      DNS_ADDR: tcp://8.8.8.8
      SOCKS5_SERVER: xz12.fgui.xyz
      SOCKS5_PORT: 12205
      SOCKS5_USERNAME: CX-US-161CC
      SOCKS5_PASSWORD: tiktok666888

    networks:
      vlan:
        ipv4_address: 172.19.0.14                                               # 修改不同的IP【*】
networks:
  vlan:
    external: true
```
