#Alpine

docker build -t ghcr.io/xnormnet/docker-images:mcdr_alpine_jdk8 ./mcdr/alpine/jdk8
docker push ghcr.io/xnormnet/docker-images:mcdr_alpine_jdk8

docker build -t ghcr.io/xnormnet/docker-images:mcdr_alpine_jdk16 ./mcdr/alpine/jdk16
docker push ghcr.io/xnormnet/docker-images:mcdr_alpine_jdk16

#Slim

docker build -t ghcr.io/xnormnet/docker-images:mcdr_slim_jdk8 ./mcdr/slim/jdk8
docker push ghcr.io/xnormnet/docker-images:mcdr_slim_jdk8

docker build -t ghcr.io/xnormnet/docker-images:mcdr_slim_jdk11 ./mcdr/slim/jdk11
docker push ghcr.io/xnormnet/docker-images:mcdr_slim_jdk11

docker build -t ghcr.io/xnormnet/docker-images:mcdr_slim_jdk16 ./mcdr/slim/jdk16
docker push ghcr.io/xnormnet/docker-images:mcdr_slim_jdk16

docker build -t ghcr.io/xnormnet/docker-images:mcdr_slim_jdk17 ./mcdr/slim/jdk17
docker push ghcr.io/xnormnet/docker-images:mcdr_slim_jdk17
