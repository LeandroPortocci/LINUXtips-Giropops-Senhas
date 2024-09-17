FROM python:3.11-slim
RUN apt-get update && \
    apt-get install -y git redis-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN git clone https://github.com/badtuxx/giropops-senhas.git .
RUN pip install --no-cache-dir -r requirements.txt
ENV REDIS_HOST=localhost
CMD redis-server & \
    flask run --host=0.0.0.0
EXPOSE 5000
