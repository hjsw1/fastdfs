FROM ypzhuang/fastdfs_base

ENV TRACKER_SERVER=

COPY storage.conf /etc/fdfs/storage.conf

COPY ./http.conf /etc/fdfs/
COPY ./mime.types /etc/fdfs/
COPY ./mod_fastdfs.conf /etc/fdfs/
COPY ./nginx.conf /usr/local/nginx/conf/

RUN git clone https://github.com/happyfish100/fastdfs-nginx-module.git --depth 1
RUN wget http://nginx.org/download/nginx-1.15.4.tar.gz
RUN tar -zxvf nginx-1.15.4.tar.gz && cd nginx-1.15.4 && \
    ./configure --with-http_stub_status_module --with-http_ssl_module \
    --with-http_realip_module --add-module=/usr/local/src/fastdfs-nginx-module/src/ \
    --with-http_image_filter_module && make && make install \
    && cd .. && rm -Rf nginx-1.15.4 && rm -Rf fastdfs-nginx-module 
    


EXPOSE 23000 8888

ADD start.sh /
ENTRYPOINT ["/start.sh"]
