# app-platform-demo

## Setup

```bash
doctl auth init --context <name>
doctl auth switch <name>

curl -L https://github.com/ko1nksm/shdotenv/releases/latest/download/shdotenv --output /usr/local/bin/shdotenv
chmod +x /usr/local/bin/shdotenv
```

## Create

```bash
shdotenv -e .env.dev envsubst '${STATIC_ACCESS_KEY_ID} ${STATIC_SECRET_KEY} ${STATIC_BUCKET_NAME} ${STATIC_ENDPOINT_URL}
${DJANGO_SECRET_KEY} ${GUNICORN_WORKERS}' <app-platform.yaml.tpl | doctl apps create --spec -
```

## Update

```bash
doctl apps
shdotenv -e .env.dev envsubst '${STATIC_ACCESS_KEY_ID} ${STATIC_SECRET_KEY} ${STATIC_BUCKET_NAME} ${STATIC_ENDPOINT_URL}
${DJANGO_SECRET_KEY} ${GUNICORN_WORKERS}' <app-platform.yaml.tpl | doctl apps update <app-id> --spec -
```
