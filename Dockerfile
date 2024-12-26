FROM alpine:latest

RUN <<EOF
    set -eux
    apk add --no-cache mpd

    mkdir -p /music
    mkdir -p /usr/src/mpd/playlists
    touch /var/lib/mpd/database \
        /var/lib/mpd/mpd.pid \
        /var/lib/mpd/state \
        /var/lib/mpd/sticker.sql
EOF

COPY mpd.conf /etc/mpd.conf

EXPOSE 6600 6600

CMD ["mpd", "--stdout", "--no-daemon"]