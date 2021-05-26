databases:
- engine: PG
  name: db
  num_nodes: 1
  size: db-s-dev-database
  version: "12"
envs:
- key: DATABASE_NAME
  scope: RUN_AND_BUILD_TIME
  value: ${db.DATABASE}
- key: DATABASE_USERNAME
  scope: RUN_AND_BUILD_TIME
  value: ${db.USERNAME}
- key: DATABASE_PASSWORD
  scope: RUN_AND_BUILD_TIME
  value: ${db.PASSWORD}
- key: DATABASE_HOST
  scope: RUN_AND_BUILD_TIME
  value: ${db.HOSTNAME}
- key: DATABASE_PORT
  scope: RUN_AND_BUILD_TIME
  value: ${db.PORT}
- key: STATIC_ACCESS_KEY_ID
  scope: RUN_AND_BUILD_TIME
  value: ${STATIC_ACCESS_KEY_ID}
- key: STATIC_SECRET_KEY
  scope: RUN_AND_BUILD_TIME
  value: ${STATIC_SECRET_KEY}
- key: STATIC_BUCKET_NAME
  scope: RUN_AND_BUILD_TIME
  value: ${STATIC_BUCKET_NAME}
- key: STATIC_ENDPOINT_URL
  scope: RUN_AND_BUILD_TIME
  value: ${STATIC_ENDPOINT_URL}
jobs:
- dockerfile_path: Dockerfile
  github:
    branch: main
    deploy_on_push: true
    repo: svidela/app-platform-demo
  instance_count: 1
  instance_size_slug: basic-xxs
  kind: PRE_DEPLOY
  name: app-platform-demo-migrations
  run_command: python manage.py migrate
  source_dir: /
name: app-platform-demo-2
region: nyc
services:
- dockerfile_path: Dockerfile
  envs:
  - key: GUNICORN_WORKERS
    scope: RUN_AND_BUILD_TIME
    value: "${GUNICORN_WORKERS}"
  - key: DJANGO_SECRET_KEY
    scope: RUN_AND_BUILD_TIME
    value: ${DJANGO_SECRET_KEY}
  - key: DJANGO_ALLOWED_HOSTS
    scope: RUN_AND_BUILD_TIME
    value: ${APP_DOMAIN}
  github:
    branch: main
    deploy_on_push: true
    repo: svidela/app-platform-demo
  http_port: 8000
  instance_count: 1
  instance_size_slug: basic-xxs
  name: app-platform-demo
  routes:
  - path: /
  run_command: |
    /venv/bin/gunicorn --worker-tmp-dir /dev/shm demo.wsgi
  source_dir: /
