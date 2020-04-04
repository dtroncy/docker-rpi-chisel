# dtroncy/rpi-chisel
FROM dtroncy/rpi-alpine:3.9

ARG chisel_version

WORKDIR /app

RUN apk update \
    && apk add --no-cache ca-certificates wget \
    && wget --no-check-certificate https://github.com/jpillora/chisel/releases/download/v${chisel_version}/chisel_${chisel_version}_linux_armv7.gz \
    && gunzip chisel_linux_arm.gz \
    && mv chisel_linux_arm chisel \
    && chmod +x chisel

ENTRYPOINT ["/app/chisel"]