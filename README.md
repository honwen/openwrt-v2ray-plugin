# V2ray-plugin for OpenWrt

- Another Choice: [xray-plugin](https://github.com/honwen/openwrt-precompiled-feeds)

## 介绍

- [v2ray-plugin][v]

  Yet another SIP003 plugin for shadowsocks, based on v2ray

## 编译

- 从 OpenWrt 的 [SDK][s] 编译

  ```bash
  # 以 ar71xx 平台为例
  tar xJf openwrt-sdk-18.06.1-ar71xx-tiny_gcc-7.3.0_musl.Linux-x86_64.tar.xz
  cd openwrt-sdk-*-ar71xx-*
  # 获取 v2ray-plugin Makefile
  git clone https://github.com/chenhw2/openwrt-v2ray-plugin.git package/v2ray-plugin
  # 选择要编译的包 Network -> v2ray-plugin
  make menuconfig
  # 开始编译
  make package/v2ray-plugin/compile V=99
  ```

[s]: https://openwrt.org/docs/guide-developer/using_the_sdk#obtain_the_sdk
[v]: https://github.com/shadowsocks/v2ray-plugin
