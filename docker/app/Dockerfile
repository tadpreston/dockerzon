FROM ruby:2.5-alpine

RUN apk update && apk add build-base nodejs mongodb-tools

ENV RAILS_ROOT /var/www/dockerzon
RUN mkdir -p $RAILS_ROOT

WORKDIR $RAILS_ROOT

ENV RAILS_ENV='production'
ENV RAKE_ENV='production'

COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs --without development test

COPY . .

CMD ["bundle", "exec", "puma", "-C", "config/puma/production.rb"]
