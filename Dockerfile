FROM python:3.8-slim

RUN python -m venv /venv && . /venv/bin/activate

WORKDIR /demo
COPY . .

RUN pip install --upgrade pip && pip install -r requirements.txt

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

CMD ["gunicorn", "demo.wsgi"]
