FROM python:3.8-slim

WORKDIR /usr/src/app

COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

CMD ["gunicorn", "demo.wsgi"]
