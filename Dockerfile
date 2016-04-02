FROM tomcat:8
MAINTAINER denverdino@gmail.com
ENV RESERVED_MEGABYTES 64
COPY entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
