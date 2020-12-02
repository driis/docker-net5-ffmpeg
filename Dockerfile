FROM mcr.microsoft.com/dotnet/runtime:5.0
WORKDIR /app

######################################################################################################################
################################################# INSTALLING FFMPEG ##################################################
RUN apt-get update ; apt-get install -y git build-essential gcc make yasm autoconf automake cmake libtool libmp3lame-dev pkg-config libunwind-dev zlib1g-dev libssl-dev

RUN apt-get update \
    && apt-get clean \
    && apt-get install -y --no-install-recommends libc6-dev libgdiplus wget software-properties-common

RUN wget https://www.ffmpeg.org/releases/ffmpeg-4.0.2.tar.gz
RUN tar -xzf ffmpeg-4.0.2.tar.gz; rm -r ffmpeg-4.0.2.tar.gz
RUN cd ./ffmpeg-4.0.2; ./configure --enable-gpl --enable-libmp3lame --enable-decoder=mjpeg,png --enable-encoder=png --enable-openssl --enable-nonfree

RUN make
RUN make install
######################################################################################################################
######################################################################################################################