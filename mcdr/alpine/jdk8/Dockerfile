FROM        openjdk:8-jdk-alpine

LABEL       author="skuzow" vendor="xnormcloud" version="2.0.0"

RUN         apk update \
         && apk upgrade --available && sync \
         && apk add --no-cache --upgrade curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 gcc musl-dev linux-headers python3-dev py3-setuptools py3-pip bash wget \
         && update-ca-certificates \
         && adduser -D -h /home/container 'container' wheel

USER        root
RUN         chown -R container:container /home \
         && chmod 777 -R  /home \
         && chown -R container:container /home/container \
         && chmod 777 -R  /home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home
RUN         echo sh v1.1.2 \
         && if [[ -e start.sh ]] ; then rm start.sh ; else wget https://raw.githubusercontent.com/xnormcloud/docker-images/master/mcdr/start.sh ; fi

CMD         ["/bin/bash", "/home/start.sh"]
