FROM centos:5

WORKDIR /root

RUN sed -i 's/enabled=1/enabled=0/' /etc/yum/pluginconf.d/fastestmirror.conf
RUN sed -i 's/mirrorlist/#mirrorlist/' /etc/yum.repos.d/*.repo
RUN sed -i 's|#\(baseurl.*\)mirror.centos.org/centos/$releasever|\1vault.centos.org/5.11|' /etc/yum.repos.d/*.repo

RUN yum update -y

ADD rustup-init /root

RUN /root/rustup-init -y

ENV PATH=/root/.cargo/bin:$PATH

