FROM python:3.7-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONBUFFERED 1
ENV GRPC_PYTHON_BUILD_SYSTEM_ZLIB true
ENV GRPC_PYTHON_BUILD_EXT_COMPILER_JOBS 16

RUN set -eux \
  && apk add --no-cache --virtual .build-deps build-base \
     libressl-dev libffi-dev gcc musl-dev python3-dev \
     libc-dev libxslt-dev libxml2-dev libc6-compat bash \
  && pip install --upgrade pip setuptools wheel google-cloud-pubsub\
  && rm -rf /root/.cache/pip

CMD [ "python3" ]
