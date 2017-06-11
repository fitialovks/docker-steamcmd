FROM ubuntu:16.04

RUN apt-get update
RUN apt-get upgrade -y

COPY multiverse.list /etc/apt/sources.list.d/

RUN dpkg --add-architecture i386

RUN apt-get update
RUN apt-get upgrade -y

# Steam CMD dependencies (at least some are)
RUN apt-get install -y lib32gcc1 ca-certificates net-tools lib32stdc++6 lib32z1 lib32z1-dev

# For installing steamcmd (FFS)
RUN apt-get install -y --no-install-recommends expect

RUN useradd --create-home steam
WORKDIR /home/steam
RUN su steam

COPY install-steam.exp ./
COPY start.sh ./
COPY steamcmd.sh ./

RUN ./install-steam.exp

RUN ./steamcmd.sh +login anonymous +quit

CMD ["/bin/bash"]
