#!/usr/bin/env bash
while :; do
    inotifywait -e modify /opt/data/cuttlerat.ru/temp/tmp &>/dev/null
    docker pull cuttlerat/pybot
    docker stop pybot
    docker rm pybot
    docker run -d --name pybot \
        -e "VIRTUAL_HOST=tokens.cuttlerat.ru" \
        -e "VIRTUAL_PORT=10033" \
        -e "LETSENCRYPT_HOST=tokens.cuttlerat.ru" \
        -e "LETSENCRYPT_EMAIL=avkioller@gmail.com" \
        --expose "10033" \
        -v "/opt/data/pybot/data:/pybot/data" \
        -v "/opt/data/pybot/config:/pybot/config" \
        --restart always \
        cuttlerat/pybot
done
