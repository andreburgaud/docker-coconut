FROM python:3.7.2-slim-stretch

ARG COCONUT_VERSION=1.4.0
ENV COCONUT_VERSION=$COCONUT_VERSION

LABEL coconut.version=$COCONUT_VERSION \
      maintainer="andre.burgaud@gmail.com"

RUN _build_deps='build-essential' \
    && set -x \
    && apt-get update && apt-get install -yqq $_build_deps --no-install-recommends \
    && pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir coconut[all]==$COCONUT_VERSION \
    && pip install --upgrade --no-cache-dir ipython \
    && pip install --no-cache-dir numpy \
    && pip install --no-cache-dir matplotlib \
    && apt-get purge -y --auto-remove $_build_deps

# Create dedicated jupyter user
RUN groupadd jupyter && useradd -g jupyter jupyter

RUN mkdir p /home/jupyter \
    && touch /home/jupyter/.coconut_history \
    && chown -R jupyter:jupyter /home/jupyter

WORKDIR /notebooks

EXPOSE 8888

CMD ["coconut", "--target", "36"]

USER jupyter
