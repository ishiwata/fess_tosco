FROM centos:7
MAINTAINER TOSCO <support@tosco.co.jp>
ENV http_proxy http://proxy.ok.tosco.co.jp:8080
ENV https_proxy http://proxy.ok.tosco.co.jp:8080
ENV FESS_VERSION=10.2.1
ENV FESS_FILENAME=fess-${FESS_VERSION}.zip

WORKDIR /tmp

# java
RUN yum -y update && yum -y install \
  java-1.8.0-openjdk \
  unzip \
  && yum clean all

# fess
# RUN curl -OL ${FESS_REMOTE_URI}
ADD fess-10.2.1.zip /tmp/fess-10.2.1.zip
RUN unzip /tmp/${FESS_FILENAME} -d /opt
RUN rm /tmp/${FESS_FILENAME}
RUN ln -s /opt/fess-${FESS_VERSION} /opt/fess

WORKDIR /opt/fess

ENTRYPOINT [ "/opt/fess/bin/fess" ]
CMD [ "/opt/fess/bin/fess" ]

EXPOSE 8080 9201 9301
