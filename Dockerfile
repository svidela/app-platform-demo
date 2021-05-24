FROM python:3.8-slim

RUN groupadd -g 999 demo && \
    useradd  -m -u 999 -g demo demo

WORKDIR /demo

COPY . .

RUN chown -R demo:demo /demo

USER demo

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

CMD ["gunicorn", "demo.wsgi"]
