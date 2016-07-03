FROM ruby:2.3.1

RUN useradd -ms /bin/bash ubuntu
RUN mkdir /home/ubuntu/tracking

COPY . /home/ubuntu/tracking
WORKDIR /home/ubuntu/tracking

RUN apt-get update && apt-get install -y libpq-dev postgresql-server-dev-9.4 postgresql
RUN bundle install

EXPOSE 4567

USER ubuntu

ENV PORT=8080

CMD ruby app.rb
