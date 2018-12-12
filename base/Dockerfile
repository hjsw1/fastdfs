FROM centos:7
MAINTAINER ypzhuang <zhuangyinping@gmail.com>

ENV TZ=Asia/Shanghai

WORKDIR /usr/local/src

RUN yum install git gcc gcc-c++ make automake autoconf libtool pcre pcre-devel zlib zlib-devel openssl-devel wget gd-devel  -y

RUN git clone https://github.com/happyfish100/libfastcommon.git --depth 1
RUN cd libfastcommon && ./make.sh && ./make.sh install && cd .. && rm -Rf  libfastcommon

RUN git clone https://github.com/happyfish100/fastdfs.git --depth 1
RUN cd fastdfs && ./make.sh && ./make.sh install && cd .. && rm -Rf fastdfs

RUN mkdir /home/dfs
VOLUME /home/dfs

