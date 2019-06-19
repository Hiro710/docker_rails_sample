FROM ruby:2.6.3

ENV APP_HOME /sampleapp

RUN apt-get update -qq && \
  apt-get install -y --no-install-recommends \
  build-essential \
  libpq-dev \
  nodejs && \
  apt-get clean

WORKDIR $APP_HOME
ENV BUNDLE_JOBS=4

COPY Gemfile Gemfile.lock $APP_HOME/

RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install
ADD . /sampleapp
