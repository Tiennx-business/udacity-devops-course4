FROM python:3.10.0

RUN apt update -y && \
    apt install -y build-essential libpq-dev && \
    pip install --upgrade pip setuptools wheel

WORKDIR /usr/src/app

COPY analytics .

RUN pip install -r requirements.txt

ENV DB_USERNAME=viettq-db-user
ENV DB_PASSWORD=viettq-db-password
ENV DB_HOST=127.0.0.1
ENV DB_PORT=5433
ENV DB_NAME=viettq-db-name

EXPOSE 5153

CMD ["python", "app.py"]