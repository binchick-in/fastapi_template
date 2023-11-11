FROM ubuntu:22.04
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        python3 \
        python3-dev \
        python3-pip \
        dumb-init
RUN mkdir -p /code
ADD requirements.txt /code/
RUN python3 -m pip install -r /code/requirements.txt
ADD . /code
WORKDIR /code
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
EXPOSE 8888
CMD ["uvicorn", "fastapi_template:app", "--port", "8888", "--host", "0.0.0.0"]
