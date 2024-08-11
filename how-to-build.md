## 构建

```
docker run --rm --privileged tonistiigi/binfmt:latest --install all
#docker buildx create --use --name=mybuilder-cn --driver docker-container --driver-opt image=dockerpracticesig/buildkit:master
docker buildx  create --use --name mybuilder --driver docker-container --driver-opt network=host
# 添加--driver-opt network=host 解决使用 buildx 构建时无法提取图像“无法执行请求”、“I/O 超时” 参考：https://github.com/docker/buildx/issues/191  
docker buildx build --platform linux/arm64,linux/amd64 -t lihaixin/gost:vpn.s . --push
docker buildx build -f Dockerfile.3.14 --platform linux/arm64,linux/amd64 -t lihaixin/gost:vpn.s --push
```
