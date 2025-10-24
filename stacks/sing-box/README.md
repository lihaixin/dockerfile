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
      DNS_ADDR: 8.8.8.8
      TYPE: client_socks5
      SERVER: xz12.fgui.xyz
      PORT: 12205
      USER: CX-US-161CC
      PASSWORD: tiktok666888

    networks:
      vlan:
        ipv4_address: 172.19.0.14                                               # 修改不同的IP【*】
networks:
  vlan:
    external: true
```
