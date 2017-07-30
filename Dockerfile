FROM ruby:2.4.1

ARG WORKDIR="/code"

WORKDIR $WORKDIR

COPY Gemfile $WORKDIR/Gemfile
COPY Gemfile.lock $WORKDIR/Gemfile.lock
RUN bundle install -j10

COPY . $WORKDIR/

EXPOSE 8080

CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0", "config.ru", "-p", "8080"]
