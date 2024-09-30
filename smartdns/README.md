# 路由器 smartdns 用法
路由器系统为 *Openwrt*


## DNS分组
`smartdns.conf` 放置目录为 `/var/etc/smartdns/smartdns.conf`。
    + `smartdns.conf`里使用参数`-group china`为国内分流
    + 并使用`-exclude-default-group`从默认组中**排除**

``` conf
server 223.5.5.5  -group china -bootstrap-dns -exclude-default-group
server-tls dot.pub  -group china
```

## 获取直连域名
使用[Loyalsoldier/v2ray-rules-dat](https://github.com/Loyalsoldier/v2ray-rules-dat)里的**直连域名列表direct-list.txt**，
下载命名为`china.domains.list`，放置在路由器`/etc/smartdns/`目录。


## 国内网站分流
在`/etc/smartdns/`中的`custom.conf`或`address.conf`中加入分流参数：
``` conf
domain-set -name china -file /etc/smartdns/china.domains.list
nameserver /domain-set:china/china
```

进而可以对`.cn`域名都做国内分流：
``` conf
nameserver /cn/china
```


## 定时更新
可以加入 Crontab 定时更新`china.domains.list`
``` crontab
0 3 * * * /usr/bin/curl -skLo /etc/smartdns/china.domains.list "https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/direct-list.txt"
```

# 参考
+ [DNS分流](https://pymumu.github.io/smartdns/config/domain-forwarding/)
+ [域名集合](https://pymumu.github.io/smartdns/config/domain-set/)
