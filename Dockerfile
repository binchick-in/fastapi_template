FROM ubuntu:20.04
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        python3.9 \
        python3.9-dev \
        python3.9-venv \
        python3-pip \
        dumb-init
RUN mkdir -p /code
ADD requirements.txt /code/
RUN python3.9 -m pip install -r /code/requirements.txt
ADD . /code
WORKDIR /code
ENTRYPOINT ["dumb-init", "--"]
EXPOSE 8888
CMD ["uvicorn", "app:app", "--port", "8888", "--host", "0.0.0.0"]