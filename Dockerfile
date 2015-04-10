FROM ruby:2.2.1

RUN gem install bundler

MKDIR /var/geminabox-data
WORKDIR /usr/local/yhmg/geminabox
ADD ./Gemfile /usr/local/yhmg/geminabox/Gemfile
RUN bundle config path ./bundler && \ NOKOGIRI_USE_SYSTEM_LIBRARIES=1 bundle install

ADD ./config.ru /usr/local/yhmg/geminabox/config.ru

EXPOSE 9292

CMD bundle exec rackup
