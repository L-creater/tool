### linux20.04 Server version: 8.0.32-0ubuntu0.20.04.2 (Ubuntu)



```shell
sudo apt install mysql-server
```

配置

```shell
sudo mysql_secure_installation 
```

出问题时，



下载mysql-workbench-community --对应mysql版本

[https://dev.mysql.com/downloads/repo/apt/]

```shell
sudo snap install mysql-workbench-community

//mysql-workbench-community 连接 mysql失败时，错误为
sudo snap connect mysql-workbench-community:password-manager-service :password-manager-service


```

