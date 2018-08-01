FROM ubuntu:14.04
MAINTAINER qwh005007@gmail.com

RUN apt-get update && \
    apt-get install -y build-essential autoconf autopoint automake git pkg-config libtool wget upx-ucl
COPY mtmips-sdk.tar.bz2 /mnt/mtmips-sdk.tar.bz2
WORKDIR /mnt
RUN tar jxf mtmips-sdk.tar.bz2 && \
    mv OpenWrt-SDK-mtmips-for-redhat-x86_64-gcc-4.8-linaro_uClibc-0.9.33.2 hc5962 && \
    rm /mnt/mtmips-sdk.tar.bz2

ENV MLIB=mipsel
ENV TOOLCHAINDIR=/mnt/hc5962/staging_dir
ENV TOOLCHAIN=/mnt/hc5962/staging_dir/toolchain-mipsel_1004kc_gcc-4.8-linaro_uClibc-0.9.33.2
ENV HOST=mipsel-openwrt-linux
ENV PATH="/mnt/hc5962/staging_dir/toolchain-mipsel_1004kc_gcc-4.8-linaro_uClibc-0.9.33.2/bin:$PATH"

RUN echo $PATH

CMD ["/bin/ping", "127.0.0.1"]
