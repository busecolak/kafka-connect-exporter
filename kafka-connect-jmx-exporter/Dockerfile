FROM abiosoft/caddy:1.0.3-no-stats

ENV TARGET_IP ""
ENV PUBLISHED_PORT ""
ENV TARGET_PORT "$PUBLISHED_PORT"
ENV ACME_AGREE "false"

COPY Caddyfile.template /caddy/template/
COPY start_caddy.sh /caddy/

RUN apk add --no-cache bash gettext

ENTRYPOINT ["/caddy/start_caddy.sh"]