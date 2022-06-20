FROM alpine
RUN apk update && apk add --no-cache alpine-base \
    openrc e2fsprogs e2fsprogs-extra dosfstools openssh mdevd \
    busybox-initscripts util-linux util-linux-misc bridge haveged dhcp unbound \
    nftables procps hostapd iw strace rsync
RUN echo "root:" | chpasswd -m
COPY files /files
RUN mv /var/* /run
RUN rsync -av --exclude "_*" --exclude "~*" /files/ /
#RUN touch /run/openrc/softlevel
