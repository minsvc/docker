FROM centos:7.2.1511

VOLUME /data
ENV PATH /opt/accur/flume/bin:$PATH
COPY env.sh /etc/profile.d/
COPY . /opt/accur 
RUN /usr/bin/rpm -ivh /opt/accur/jdk-8u51-linux-x64.rpm \
    && . /etc/profile.d/env.sh && rm -rf /opt/accur/jdk-8u51-linux-x64.rpm
ENTRYPOINT [ "start-flume"]
#CMD [ "/opt/accur/flume/bin/flume-ng" "agent" "-c" "/opt/accur/flume/conf" "-f" "/opt/accur/flume/conf/flume.conf" "-n" "agent" "-Dflume.root.logger=INFO,console start" ]
