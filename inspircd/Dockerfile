ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:edge
FROM $BUILD_FROM

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

RUN wget https://github.com/inspircd/inspircd/archive/v2.0.25.tar.gz \
    && tar xvf ./v2.0.25.tar.gz

WORKDIR /inspircd-2.0.25

RUN adduser -D inspircd

RUN ./configure \
    --prefix=/inspircd \
    --config-dir=/etc/inspircd \
    --enable-epoll \
    --enable-openssl \
    --uid=inspircd

RUN make && make install

RUN apk del --purge .build-dependencies && rm -r /inspircd-2.0.25

COPY rootfs /