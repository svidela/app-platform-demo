FROM python:3.8-slim

RUN python -m venv /venv

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PATH /venv/bin:$PATH

WORKDIR /demo
COPY . .

RUN .  activate && pip install -U pip && pip install -r requirements.txt

CMD ["gunicorn", "demo.wsgi"]
