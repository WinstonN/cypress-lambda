from lambci/lambda:build-nodejs10.x

WORKDIR /app 

RUN yum -y install wget

# https://gist.github.com/dimkir/f4afde77366ff041b66d2252b45a13db
# COPY eltool.sh .
# RUN ./eltool.sh dev-tools 
# RUN ./eltool.sh dist-deps
# RUN ./eltool.sh centos-deps
# # RUN ./eltool.sh gconf-compile gconf-install 
# RUN ./eltool.sh pixbuf-compile pixbuf-install
# RUN ./eltool.sh gtk-compile
# RUN ./eltool.sh gtk-install 
# RUN ./eltool.sh xvfb-install 

# Install Gdk-Pixbuf from fedora 16
# RUN rpm -ivh --nodeps http://dl.fedoraproject.org/pub/archive/fedora/linux/releases/16/Fedora/x86_64/os/Packages/gdk-pixbuf2-2.24.0-1.fc16.x86_64.rpm

# install extra libs
RUN yum install -y strace xorg-x11-server-Xvfb gtk2-devel gtk3-devel libnotify-devel GConf2 nss libXScrnSaver alsa-lib*

# COPY package.json .
# COPY package-lock.json .
RUN npm install cypress@4.7.0

COPY cypress.json .
COPY cypress ./cypress

# https://unix.stackexchange.com/a/315172 LMAO
COPY xkb-compile.sh .
RUN ./xkb-compile.sh

COPY pack-lib.sh .
ARG CACHE_BUST=unknown
RUN ./pack-lib.sh

COPY link.sh .
RUN ./link.sh

COPY patch.sh .
RUN ./patch.sh

# tar it up
RUN GZIP=-9 tar cvzfh lib.tar.gz ./lib
RUN GZIP=-9 tar cvzfh lib64.tar.gz ./lib64