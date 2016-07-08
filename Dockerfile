FROM centos:6.6

RUN yum install -y openswan

ADD ipsec.conf /etc/ipsec.conf
ADD run.sh /bin/run.sh

CMD ["/bin/run.sh"]