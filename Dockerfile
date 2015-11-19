FROM ruby:2.2.2-slim
MAINTAINER Tobias Lindholm <tob@antob.se>

# Ignore APT warnings about not having a TTY
ENV DEBIAN_FRONTEND noninteractive

ENV BUNDLE_GEMFILE=/app/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir /bundle
RUN mkdir /app
WORKDIR /app

# Source /etc/secrets/env if present
COPY bashrc /root/.bashrc
ENV BASH_ENV /root/.bashrc

RUN apt-get update && apt-get install -y git wget vim build-essential libreadline-dev libssl-dev libcurl4-openssl-dev libsasl2-dev libpq-dev libxslt-dev nodejs mysql-client libmysqlclient-dev postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Set the time zone
ENV TZ Europe/Stockholm
RUN echo "Europe/Stockholm" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

EXPOSE 3000
