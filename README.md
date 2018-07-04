# ubuntu下使用shadowsocks方法
## 1 安装与使用

### 1.1 无GUI安装

#### 1.1.1 安装

Ubuntu 16.04以下系统：

```shell
sudo apt-get update  
sudo apt-get install python-pip    
sudo pip install shadowsocks   
```

Ubuntu 16.04以上系统：

```shell
sudo apt-get install shadowsocks
```

#### 1.1.2 使用

```shell
sslocal -s 11.22.33.44 -p 50003 -k “123456” -l 1080 -t 600 -m aes-256-cfb
```

使用配置文件example.json：

```json
{
"server":"11.22.33.44",
"server_port":50003,
"local_port":1080,
"password":"123456",
"timeout":600,
"method":"aes-256-cfb"
}
```

启动命令：

```shell
sslocal -c example.json
```

### 1.2 GUI安装

<https://github.com/shadowsocks/shadowsocks-qt5>

安装 shadowsocks-qt5



## 2 系统配置

### 2.1 使用浏览器配置

firefox：proxy

### 2.2 安装socks5代理

通过`proxychains`实现

* 安装:

```bash
sudo apt-get install proxychains
```

* 配置：

编辑`~/.proxychains/proxychains.conf`

示例如下：

```
strict_chain
proxy_dns 
remote_dns_subnet 224
tcp_read_time_out 15000
tcp_connect_time_out 8000
localnet 127.0.0.0/255.0.0.0
quiet_mode

[ProxyList]
socks5  127.0.0.1 1080
```

* 使用方法：

在命令前加入 `proxychains`

e.g.:

```shell
proxychains curl https://www.google.com
```


