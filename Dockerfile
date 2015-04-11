FROM ruby:2.2.1

RUN gem install bundler

RUN mkdir -p /var/geminabox-data
WORKDIR /usr/local/yhmg/geminabox
ADD ./Gemfile /usr/local/yhmg/geminabox/Gemfile
RUN bundle install

ADD ./config.ru /usr/local/yhmg/geminabox/config.ru

EXPOSE 9292

CMD bundle exec rackup --host=0.0.0.0
