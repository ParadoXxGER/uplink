FROM ruby:2.4

WORKDIR /srv/kademlia

COPY Gemfile* ./

RUN bundle install

COPY . ./

ENTRYPOINT 'bin/uplink'