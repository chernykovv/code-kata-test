FROM ruby

WORKDIR /usr/src/app

COPY . .
RUN bundle install
