#FROM python:3.8
FROM python:3.9.16-alpine3.16
WORKDIR /app
COPY . .
RUN pip install --upgrade pip && pip install -r requirements.txt
#ENV ENVIRONMENT HOST PORT REDIS_HOST REDIS_PORT REDIS_DB
CMD ["python", "hello.py"]
