# syntax=docker/dockerfile:1

FROM openjdk:8u312-jre-buster

LABEL version="1.23.1"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Presents Stoneblock 2"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/38/386ff1cc602943863eea02d642bb3107c6b4ab0008dc3cf144544165ef52a939.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://Stoneblock2:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Presents Stoneblock 2 v1.23.1 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]