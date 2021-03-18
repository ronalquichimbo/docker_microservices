FROM python:3.7-alpine

WORKDIR /app
# RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev cargo
COPY ./requirements.txt .

RUN pip install -r requirements.txt
