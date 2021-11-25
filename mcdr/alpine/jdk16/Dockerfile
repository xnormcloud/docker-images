FROM        openjdk:16-jdk-alpine

LABEL       organization="xnormnet" maintainer="legendnightt" mail="alejandro.porras@xnorm.net"

RUN         apk update \
         && apk upgrade --available && sync \
         && apk add --no-cache --upgrade curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 gcc musl-dev linux-headers python3-dev py3-setuptools py3-pip bash wget \
         && update-ca-certificates \
         && pip3 install mcdreforged hjson docker \
         && adduser -D -h /home/container 'container' wheel

USER        root
RUN         chown -R container:container /home \
         && chmod 777 -R  /home \
         && chown -R container:container /home/container \
         && chmod 777 -R  /home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home
RUN         echo sh v0.1 \
         && if [[ -e start.sh ]] ; then rm start.sh ; else wget https://raw.githubusercontent.com/xnormnet/docker-images/master/mcdr/start.sh ; fi

CMD         ["/bin/bash", "/home/start.sh"]
