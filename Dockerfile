FROM python:3.8-slim

RUN python -m venv /venv

WORKDIR /demo
COPY . .

RUN . /venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

CMD ["/venv/bin/gunicorn", "demo.wsgi"]
