FROM traefik:v2.9.4

WORKDIR /usr/local/bin/

RUN \
    ## install htpasswd
    apk add --no-cache openssl ca-certificates apache2-utils; \
    ## init plugin dir
    mkdir -p /usr/local/bin/plugins-local/src/github.com/; \
    ## traefik-auth
    wget -qO "/tmp/traefik-auth.tar.gz" https://github.com/zzci/traefik-auth/archive/refs/tags/v1.0.tar.gz; \
    mkdir -p /usr/local/bin/plugins-local/src/github.com/zzci/traefik-auth ; \
    tar zxf /tmp/traefik-auth.tar.gz --strip-components=1 -C /usr/local/bin/plugins-local/src/github.com/zzci/traefik-auth; \
    ## fail2ban
    wget -qO "/tmp/fail2ban.tar.gz" https://github.com/tomMoulard/fail2ban/archive/refs/tags/v0.6.6.tar.gz; \
    mkdir -p /usr/local/bin/plugins-local/src/github.com/tomMoulard/fail2ban; \
    tar zxf /tmp/fail2ban.tar.gz --strip-components=1 -C /usr/local/bin/plugins-local/src/github.com/tomMoulard/fail2ban; \
    ## traefik-real-ip
    wget -qO "/tmp/traefik-real-ip.tar.gz" https://github.com/zzci/traefik-real-ip/archive/refs/tags/v1.0.0.tar.gz; \
    mkdir -p /usr/local/bin/plugins-local/src/github.com/zzci/traefik-real-ip; \
    tar zxf /tmp/traefik-real-ip.tar.gz --strip-components=1 -C /usr/local/bin/plugins-local/src/github.com/zzci/traefik-real-ip; \
    ## clean.
    rm -rf /tmp/*
