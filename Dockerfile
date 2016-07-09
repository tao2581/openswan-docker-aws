FROM centos:6.6

RUN yum install -y openswan which

EXPOSE 500/udp 4500/udp

ADD ipsec.conf /etc/ipsec.conf
ADD run.sh /bin/run.sh

VOLUME ["/lib/modules"]

CMD ["/bin/run.sh"]