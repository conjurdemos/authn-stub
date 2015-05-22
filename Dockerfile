FROM ruby:2.0

WORKDIR /app

EXPOSE 9292

ADD Gemfile /app/
ADD Gemfile.lock /app/

RUN bundle install

ADD config.ru /app/
ADD ws.rb /app/

ENTRYPOINT bundle exec rackup
