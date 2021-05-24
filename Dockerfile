FROM python:3.8-slim

WORKDIR /demo
COPY . .

RUN pip install -U pip && pip install -r requirements.txt

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

CMD ["gunicorn", "demo.wsgi"]
