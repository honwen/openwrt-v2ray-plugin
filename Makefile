
include $(TOPDIR)/rules.mk

PKG_NAME:=v2ray-plugin
PKG_VERSION:=0.0.1
PKG_RELEASE:=20190114
PKG_MAINTAINER:=chenhw2 <https://github.com/chenhw2>

# OpenWrt ARCH: arm, i386, x86_64, mips, mipsel
# Golang ARCH: arm[5-7], 386, amd64, mips, mipsle
PKG_ARCH:=$(ARCH)
PKG_ARCH:=$(subst i386,386,$(PKG_ARCH))
PKG_ARCH:=$(subst x86_64,amd64,$(PKG_ARCH))
PKG_ARCH:=$(subst mipsel,mipsle,$(PKG_ARCH))
PKG_ARCH:=$(subst arm7,arm,$(PKG_ARCH))

PKG_SOURCE:=v2ray-plugin-linux-$(PKG_ARCH)-$(PKG_RELEASE).tar.gz
PKG_SOURCE_URL:=https://github.com/shadowsocks/v2ray-plugin/releases/download/v$(PKG_RELEASE)/
PKG_HASH:=skip
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/v2ray-plugin
	SECTION:=net
	CATEGORY:=Network
	TITLE:=SIP003 plugin for shadowsocks, based on v2ray
	URL:=https://github.com/shadowsocks/v2ray-plugin
endef

define Package/v2ray-plugin/description
	Yet another SIP003 plugin for shadowsocks, based on v2ray
endef

define Build/Compile
	gzip -dc "$(DL_DIR)/$(PKG_SOURCE)" | tar -C $(PKG_BUILD_DIR)/ -xf -
endef

define Package/v2ray-plugin/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/v2ray-plugin_linux_$(PKG_ARCH) $(1)/usr/bin/v2ray-plugin
endef

$(eval $(call BuildPackage,v2ray-plugin))
