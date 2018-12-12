FROM ypzhuang/fastdfs_base

ENV TRACKER_SERVER=

COPY storage.conf /etc/fdfs/storage.conf

RUN cp /usr/local/src/fastdfs/conf/http.conf /etc/fdfs/
RUN cp /usr/local/src/fastdfs/conf/mime.types /etc/fdfs/


RUN git clone https://github.com/happyfish100/fastdfs-nginx-module.git --depth 1
COPY ./mod_fastdfs.conf /etc/fdfs/
COPY ./nginx.conf /usr/local/nginx/conf/

RUN wget http://nginx.org/download/nginx-1.15.4.tar.gz
RUN tar -zxvf nginx-1.15.4.tar.gz && cd nginx-1.15.4 && \
    ./configure --with-http_stub_status_module --with-http_ssl_module \
    --with-http_realip_module --add-module=/usr/local/src/fastdfs-nginx-module/src/ \
    --with-http_image_filter_module && make && make install


EXPOSE 23000 8888

ADD start.sh /
ENTRYPOINT ["/start.sh"]
