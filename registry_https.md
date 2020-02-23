## registry
[参考文档](https://docs.docker.com/registry/)
```
docker run -d -p 5000:5000 --name registry registry:2
```
Pull (or build) some image from the hub
```
docker pull ubuntu
```
Tag the image so that it points to your registry
```
docker image tag ubuntu registry.local:5000/ubuntu
```
push it
```
docker push registry.local:5000/myfirstimage
```
pull it back
```
docker pull registry.local:5000/myfirstimage
```

## https
```
mkdir -p /root/certs
cd /root/certs
openssl genrsa -out registry.local.key 2048 #生成私钥
openssl req -new -x509 -key registry.local.key -out registry.local.crt #通过私钥生成证书
```

## https+registry
```
docker stop registry && docker rm registry
docker run -d -p 5000:5000 --restart=always --name registry -v /root/registry:/var/lib/registry -v /root/certs/:/certs -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/registry.local.crt -e REGISTRY_HTTP_TLS_KEY=/certs/registry.local.key registry:2
```

## 客户端配置
```
echo "127.0.0.1 registry.local" >> /etc/hosts
mkdir -p /etc/docker/certs.d/registry.local:5000
cp /root/certs/registry.local.crt ca.crt
```

到此完成
