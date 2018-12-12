FROM ypzhuang/fastdfs_base

ENV TRACKER_SERVER=

COPY storage.conf /etc/fdfs/storage.conf

ADD start.sh /
ENTRYPOINT ["/start.sh"]


