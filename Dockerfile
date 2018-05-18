FROM alpine as builder
LABEL maintainer="playniuniu@gmail.com"

RUN apk add --update alpine-sdk cmake libmicrohttpd-dev libuv-dev
RUN git clone https://github.com/xmrig/xmrig
RUN cd xmrig \
    && mkdir build \
    && cmake -DCMAKE_BUILD_TYPE=Release \
    && make

FROM alpine

COPY --from=builder /xmrig/xmrig /usr/local/bin/xmrig
RUN apk add --no-cache --update libmicrohttpd ca-certificates

ENTRYPOINT ["xmrig"]