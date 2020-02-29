#!/bin/bash -x

if [[ -n $PUBLISHED_PORT && -n $TARGET_IP ]]; then
    export TARGET_PORT="$PUBLISHED_PORT"

    envsubst '$PUBLISHED_PORT $TARGET_PORT $TARGET_IP' < /caddy/template/Caddyfile.template > /etc/Caddyfile
else
    echo "TARGET_IP and PUBLISHED_PORT cannot be empty."
    exit 1
fi

set -- /usr/bin/caddy -conf=/etc/Caddyfile -log=stdout -agree="$ACME_AGREE" "$@"

exec "$@"