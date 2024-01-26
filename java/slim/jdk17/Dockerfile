FROM        openjdk:17-slim

LABEL       author="skuzow" vendor="xnormcloud" version="2.0.0"

RUN         apt-get update -y \
         && apt-get install -y curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 wget \
         && useradd -d /home/container -m container

USER        root
RUN         chown -R container:container /home \
         && chmod 777 -R  /home \
         && chown -R container:container /home/container \
         && chmod 777 -R  /home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home
RUN         echo sh v1.0.1 \
         && if [[ -e start.sh ]] ; then rm start.sh ; else wget https://raw.githubusercontent.com/xnormcloud/docker-images/master/java/start.sh ; fi

CMD         ["/bin/bash", "/home/start.sh"]
