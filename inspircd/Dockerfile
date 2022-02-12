ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:edge
FROM $BUILD_FROM

# https://pkgs.alpinelinux.org/package/edge/testing/x86/inspircd
# https://git.alpinelinux.org/aports/tree/testing/inspircd/APKBUILD

# Install InspIRCd
RUN apk add --no-cache --virtual .build-dependencies \
    g++ \
    make \
    perl \
    wget \
    mariadb-dev \
    libmaxminddb-dev \
    argon2-dev \
    sqlite-dev

# test

# RUN apk add \
#     argon2-dev \
# 	libmaxminddb-dev \
# 	libpq-dev \
# 	mariadb-dev \
# 	openssl1.1-compat-dev \
# 	pcre-dev \
# 	perl \
# 	re2-dev \
# 	sqlite-dev \
# 	tre-dev \
#     make \
#     g++

RUN wget https://github.com/inspircd/inspircd/archive/v2.0.25.tar.gz \
    && tar xvf ./v2.0.25.tar.gz

WORKDIR /inspircd-2.0.25

RUN ./configure \
    --prefix=/usr \
    --binary-dir=/usr/bin \
    --config-dir=/etc/inspircd \
    --data-dir=/var/lib/inspircd/data \
    --example-dir=/usr/share/inspircd/examples \
    --log-dir=/var/log/inspircd \
    --manual-dir=/usr/share/man/man1 \
    --module-dir=/usr/lib/inspircd/modules \
    --script-dir=/usr/lib/inspircd/scripts \
    --socketengine=epoll \
    --gid=inspircd \
    --uid=inspircd \
    --development

RUN adduser -D inspircd

RUN make && make install

RUN apk del --purge .build-dependencies 

COPY rootfs /