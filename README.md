# docker-rpi-chisel

<img src="https://badgen.net/badge/platform/raspberry%20pi?list=1"/> <a href="https://hub.docker.com/r/dtroncy/rpi-chisel"><img src="https://badgen.net/badge/icon/docker?icon=docker&label"/></a> <a href="https://travis-ci.org/dtroncy/docker-rpi-chisel"><img src="https://badgen.net/travis/babel/babel?icon=travis&label=build"/></a>

This is a raspberry pi compatible <a href="https://github.com/jpillora/chisel">Chisel</a> DockerFile.

To build it :

    docker build --build-arg chisel_version=$chisel_version -t dtroncy/rpi-chisel .

$chisel_version is version of chisel you want to install.

 <a href="https://github.com/jpillora/chisel">Consult official documentation to use it</a>

### SOCKS5 example

1. Start your chisel server

```sh
docker run \
  --name chisel -p 9312:9312 \
  -d --restart always \
  dtroncy/rpi-chisel server -p 9312 --socks5 --key supersecret
```

2. Connect your chisel client (using server's fingerprint)

```sh
chisel client --fingerprint ab:12:34 server-address:9312 socks
```

3. Point your SOCKS5 clients (e.g. OS/Browser) to:

```
localhost:1080
```

4. Now you have an encrypted, authenticated SOCKS5 connection over HTTP
