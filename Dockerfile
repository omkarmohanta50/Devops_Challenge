FROM python:3.12-slim


RUN apt-get update && \
    apt-get install -y libcap2-bin && \
    rm -rf /var/lib/apt/lists/*

RUN pip install flask

RUN useradd -m appuser


WORKDIR /app

COPY app/main.py .


# explicitely telling it to use ports less than 1024 by giving permission to python binary

RUN setcap 'CAP_NET_BIND_SERVICE=+ep' /usr/local/bin/python3.12


USER appuser

EXPOSE 80

CMD [ "python3","main.py" ]

