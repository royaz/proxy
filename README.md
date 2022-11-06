# traefik

```

git clone https://github.com/zzci/traefik.git

cd traefik

cp -a .env.example .env

./aa init
./aa run
```

## plugin

https://github.com/zzci/traefik-auth
```yml
http:
  middlewares:
    test-traefik-auth:
      plugin:
        traefik-auth:
          JwtHeaders:
            Subject: sub
          AuthCookie: "__AUTH_JWT"
          Keys:
            - |
              -----BEGIN PUBLIC KEY-----
              MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnzyis1ZjfNB0bBgKFMSv
              vkTtwlvBsaJq7S5wA+kzeVOVpVWwkWdVha4s38XM/pa/yr47av7+z3VTmvDRyAHc
              aT92whREFpLv9cj5lTeJSibyr/Mrm/YtjCZVWgaOYIhwrXwKLqPr/11inWsAkfIy
              tvHWTxZYEcXLgAXFuUuaS3uF9gEiNQwzGTU1v0FqkqTBr4B8nW3HCN47XUu0t8Y0
              e+lf4s4OxQawWD79J9/5d3Ry0vbV3Am1FtGJiJvOwRsIfVChDpYStTcHTCMqtvWb
              V6L11BWkpzGXSW4Hv43qa+GSYOD2QU68Mb59oSk2OB+BtOLpJofmbGEGgvmwyCI9
              MwIDAQAB
              -----END PUBLIC KEY-----
          OpaAllowField: allow
          OpaHeaders:
            Allowed: allow
          OpaUrl: http://localhost:8181/v1/data/example
          PayloadFields:
            - exp
          Required: "true"
```
https://github.com/tomMoulard/fail2ban
```yml
http:
  middlewares:
    my-fail2ban:
      plugin:
        fail2ban:
          blacklist:
            ip:
              - 192.168.0.0/24
          rules:
            action: ""
            actionAbuseipdb: ""
            backend: ""
            banaction: ""
            banactionAllports: ""
            bantime: 3h
            chain: ""
            destemail: ""
            enabled: "true"
            fail2banAgent: ""
            filter: ""
            findtime: 10m
            ignorecommand: ""
            logencoding: UTF-8
            maxretry: "4"
            mode: ""
            mta: ""
            ports: 0:8000
            protocol: ""
            sender: ""
            urlregexp: ""
            usedns: ""
          whitelist:
            ip:
              - ::1
              - 127.0.0.1
```

https://github.com/soulbalz/traefik-real-ip

```yml
http:
  middlewares:
    my-traefik-real-ip:
      plugin:
        traefik-real-ip:
          excludednets:
            - 1.1.1.1/24
```