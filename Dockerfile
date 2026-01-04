FROM debian:stable AS builder

ARG MC_VERSION=1.21.11
ARG FABRIC_VERSION=0.18.4
ARG INSTALLER_VERSION=1.1.1

RUN apt-get -y update && \
    apt-get -y install curl unzip

WORKDIR /build
RUN curl -o server.jar https://meta.fabricmc.net/v2/versions/loader/${MC_VERSION}/${FABRIC_VERSION}/${INSTALLER_VERSION}/server/jar

FROM amazoncorretto:21-alpine-jdk AS server
WORKDIR /server

COPY --from=builder /build/server.jar .

RUN java -jar server.jar --initSettings
RUN sed -i -e 's/false/true/g' eula.txt
COPY server/* .

EXPOSE 25565
ENTRYPOINT [ "java" ] 
CMD [ "-Xmx4G", "-jar", "server.jar", "nogui" ]