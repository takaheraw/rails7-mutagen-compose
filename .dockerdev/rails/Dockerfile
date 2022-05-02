# syntax=docker/dockerfile:1

ARG RUBY_VERSION=3.1.2

FROM ruby:${RUBY_VERSION}

ARG DEBIAN_FRONTEND=noninteractive
ARG BUNDLER_VERSION=2.3.12
ENV GEM_HOME=/usr/local/bundle
ENV BUNDLE_PATH=$GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH
ENV BUNDLE_BIN=/usr/local/bin
ENV BUNDLE_JOBS=4
ENV BUNDLE_RETRY=3
ENV LANG=C.UTF-8
ENV APP_ROOT=/app
ENV PATH ${APP_ROOT}/bin:$PATH
ENV RAILS_ENV=development
ENV BIND="0.0.0.0"

RUN apt-get update -qq \
  && echo "Etc/UTC" > /etc/localtime \
  && apt-get install -yq --no-install-recommends \
    curl \
    default-mysql-client \
    git \
    tini \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

WORKDIR ${APP_ROOT}

RUN gem update --system  --no-document && \
  rm -f /usr/local/bin/ruby/gems/*/specifications/default/bundler-*.gemspec && \
  gem install bundler -v ${BUNDLER_VERSION} --no-document

COPY Gemfile Gemfile.lock ${APP_ROOT}/

RUN bundle config set --local path 'vendor/bundle' \
  && bundle install

ENTRYPOINT ["/usr/bin/tini", "--"]
EXPOSE 3000
