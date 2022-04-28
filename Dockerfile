FROM ruby:3.1.0-alpine
LABEL maintainer="Guillermo Mora"

ARG HOST_UID=1000
ARG HOST_GID=1000

RUN apk add --no-cache --update build-base 
RUN rm -rf /var/cache/apk/*

RUN addgroup -S rubydev -g ${HOST_GID} && \
    adduser -S rubydev -G rubydev -u ${HOST_UID}
USER rubydev

WORKDIR /app
COPY --chown=rubydev:rubydev Gemfile* ./

RUN gem install bundler
RUN bundle install

COPY --chown=rubydev:rubydev . ./