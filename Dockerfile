FROM ruby:2.5
LABEL NAME=sebastien
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir -p /myapp
WORKDIR /myapp
COPY . .
RUN useradd -m sebastien
RUN chown -R sebastien:sebastien /myapp
USER sebastien

RUN bundle install

EXPOSE 3000