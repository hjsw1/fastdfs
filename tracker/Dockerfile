FROM ypzhuang/fastdfs_base

COPY tracker.conf /etc/fdfs/tracker.conf

EXPOSE 22122

ADD start.sh /
ENTRYPOINT ["/start.sh"]
