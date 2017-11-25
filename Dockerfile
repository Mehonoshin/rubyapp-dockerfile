FROM ruby:2.4.2
MAINTAINER Stanislav Mekhonoshin <mekhonoshin@howtohireme.ru>

RUN apt-get -y update
RUN apt-get -y install nodejs netcat

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

WORKDIR /app

ENV RAILS_ENV production

RUN gem install foreman
RUN bundle install --deployment --without development test
