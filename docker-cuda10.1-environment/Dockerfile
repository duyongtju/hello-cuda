FROM paddlepaddle/paddle:2.0.0-gpu-cuda10.1-cudnn7

ARG BOOST_VERSION=1.73.0
ARG BOOST_VERSION_=1_73_0
ENV BOOST_VERSION=${BOOST_VERSION}
ENV BOOST_VERSION_=${BOOST_VERSION_}
ENV BOOST_ROOT=/usr/include/boost

ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && \
    apt-get install -y --no-install-recommends tzdata build-essential cmake gdb openssh-server rsync vim git wget

# config sshd
#RUN mkdir /var/run/sshd
RUN sed -ri 's/^#PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    sed -i 's/^Port.*/Port 8678/g' /etc/ssh/sshd_config && \
    sed -ri 's/RSYNC_ENABLE=false/RSYNC_ENABLE=true/g' /etc/default/rsync

# config rsync service
COPY rsync.conf /etc
RUN echo 'root:root123' |chpasswd
RUN mkdir /root/sync
# install boost
#RUN wget --max-redirect 3 --no-check-certificate https://dl.bintray.com/boostorg/release/${BOOST_VERSION}/source/boost_${BOOST_VERSION_}.tar.gz
#RUN wget --no-check-certificate https://sourceforge.net/projects/boost/files/boost/${BOOST_VERSION}/boost_${BOOST_VERSION_}.tar.gz/download -O boost_${BOOST_VERSION_}.tar.gz
COPY boost_${BOOST_VERSION_}.tar.gz boost_${BOOST_VERSION_}.tar.gz
RUN mkdir -p /usr/include/boost && tar zxf boost_${BOOST_VERSION_}.tar.gz -C /usr/include/boost --strip-components=1 && rm *.tar.gz

COPY entrypoint.sh /sbin
RUN chmod +x /sbin/entrypoint.sh
ENTRYPOINT [ "/sbin/entrypoint.sh" ]
