FROM tomcat:8
MAINTAINER denverdino@gmail.com
ENV RESERVED_MEGABYTES 64
ENV MIN_HEAP_MEGABYTES 64
ENV MAX_HEAP_MEGABYTES 8192
COPY entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
