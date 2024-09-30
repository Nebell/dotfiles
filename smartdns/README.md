# 路由器 smartdns 用法
路由器系统为 *Openwrt*


`smartdns.conf` 放置目录为 `/var/etc/smartdns/smartdns.conf`。
    + `smartdns.conf`里使用参数`-group china`为国内分流
    + 并使用`-exclude-default-group`从默认组中排除

``` conf
server 223.5.5.5  -group china -bootstrap-dns -exclude-default-group
server-tls dot.pub  -group china
```


使用`dnsmasq.china-domain-list.filter.sh`生成简化过后的国内域名列表`china.domains.list`，
放置在路由器`/etc/smartdns/`目录。


在`/etc/smartdns/`中的`custom.conf`或`address.conf`中加入分流参数：
``` conf
domain-set -name china -file /etc/smartdns/china.domains.list
nameserver /domain-set:china/china
```

进而可以对`.cn`域名都做国内分流：
``` conf
nameserver /cn/china
```
