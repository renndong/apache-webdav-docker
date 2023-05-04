
# Apache WebDAV docker

[镜像地址](https://hub.docker.com/repository/docker/renndong/apache-webdav/general) | [Github仓库](https://github.com/renndong/apache-webdav-docker)

## 使用方法

首先拉取镜像

```bash
docker pull renndong/apache-webdav:latest
```

生成密码文件

```bash
$ htpasswd -cm your/config/dir/user.passwd your_username
New password:
Re-type new password:
Adding password for user your_username
```

如果需要使用HTTPS，镜像会检测`config`目录下是否包含SSL证书`server.crt`和私钥`server.key`，如果都存在将会自动启用HTTPS。

### 命令行方式

```bash
docker run -d \
    --name apache-webdav \
    --restart unless-stopped \
    -p 80:80 \
    -p 443:443 \
    -e PUID=$UID \
    -e PGID=$GID  \
    -v path/to/your/data/dir:/data \
    -v path/to/your/config/dir:/config \
    renndong/apache-webdav:latest
```

### docker compose

编辑`docker-compose.yaml`并使用命令`docker compose up -d`启动。

