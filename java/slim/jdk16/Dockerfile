FROM        openjdk:16-slim

LABEL       author="legendnightt" vendor="xnormnet" version="0.0.1"

RUN         apt-get update -y \
         && apt-get install -y curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 \
         && useradd -d /home/container -m container

USER        root
RUN         chown -R container:container /home \
         && chmod 777 -R  /home \
         && chown -R container:container /home/container \
         && chmod 777 -R  /home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home
RUN         echo sh v0.0.1 \
         && if [[ -e start.sh ]] ; then rm start.sh ; else wget https://raw.githubusercontent.com/xnormnet/docker-images/master/java/start.sh ; fi

CMD         ["/bin/bash", "/home/start.sh"]
