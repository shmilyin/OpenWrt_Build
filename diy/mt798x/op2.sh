#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================             


##
svn export https://github.com/coolsnowwolf/luci/trunk/libs/luci-lib-fs ./package/add/luci-lib-fs
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-filetransfer ./package/add/luci-app-filetransfer
sed -i "s/\.\.\/\.\./\$\(TOPDIR\)\/feeds\/luci/g" ./package/add/luci-app-filetransfer/Makefile
cp -af ./package/add/luci-app-filetransfer/po/zh-cn  ./package/add/luci-app-filetransfer/po/zh_Hans


##配置IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

##
rm -rf ./feeds/xiangfeidexiaohuo/theme/luci-theme-argon-18.06
rm -rf ./feeds/xiangfeidexiaohuo/theme/luci-app-argon-config-18.06
rm -rf ./feeds/xiangfeidexiaohuo/theme/luci-theme-design
rm -rf ./feeds/xiangfeidexiaohuo/theme/luci-theme-edge
rm -rf ./feeds/xiangfeidexiaohuo/theme/luci-theme-ifit
rm -rf ./feeds/xiangfeidexiaohuo/theme/luci-theme-opentopd
rm -rf ./feeds/xiangfeidexiaohuo/theme/luci-theme-neobird

rm -rf ./package/feeds/xiangfeidexiaohuo/luci-theme-argon-18.06
rm -rf ./package/feeds/xiangfeidexiaohuo/luci-app-argon-config-18.06
rm -rf ./package/feeds/xiangfeidexiaohuo/theme/luci-theme-design
rm -rf ./package/feeds/xiangfeidexiaohuo/theme/luci-theme-edge
rm -rf ./package/feeds/xiangfeidexiaohuo/theme/luci-theme-ifit
rm -rf ./package/feeds/xiangfeidexiaohuo/theme/luci-theme-opentopd
rm -rf ./package/feeds/xiangfeidexiaohuo/theme/luci-theme-neobird


##取消bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile

##更改主机名
sed -i "s/hostname='.*'/hostname='AE86Wrt'/g" package/base-files/files/bin/config_generate

##加入作者信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='AE86Wrt-$(date +%Y%m%d)'/g"  package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' By YaoDao'/g" package/base-files/files/etc/openwrt_release
cp -af feeds/xiangfeidexiaohuo/patch/banner  package/base-files/files/etc/

##WiFi
sed -i "s/ImmortalWrt/AE86/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

##
sed -i "53iLUCI_LANG.zh-cn=\$(LUCI_LANG.zh_Hans)" feeds/luci/luci.mk
sed -i "54iLUCI_LANG.zh-tw=\$(LUCI_LANG.zh_Hant)" feeds/luci/luci.mk


##FQ全部调到VPN菜单
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-ssr-plus/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/*.lua
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm

sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/passwall/*.lua
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/model/cbi/passwall/client/*.lua
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/model/cbi/passwall/server/*.lua
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/view/passwall/app_update/*.htm
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/view/passwall/auto_switch/*.htm
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/view/passwall/global/*.htm
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/view/passwall/haproxy/*.htm
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/view/passwall/log/*.htm
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/view/passwall/node_list/*.htm
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/view/passwall/rule/*.htm
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/view/passwall/server/*.htm

sed -i 's/services/vpn/g' package/feeds/luci/luci-app-vssr/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-vssr/luasrc/model/cbi/vssr/*.lua
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-vssr/luasrc/view/vssr/*.htm

sed -i 's/services/vpn/g' package/feeds/luci/luci-app-openclash/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-openclash/luasrc/*.lua
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-openclash/luasrc/model/cbi/openclash/*.lua
sed -i 's/services/vpn/g' package/feeds/luci/luci-app-openclash/luasrc/view/openclash/*.htm

sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-bypass/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-bypass/luasrc/model/cbi/bypass/*.lua
sed -i 's/services/vpn/g' package/feeds/xiangfeidexiaohuo/luci-app-bypass/luasrc/view/bypass/*.htm
