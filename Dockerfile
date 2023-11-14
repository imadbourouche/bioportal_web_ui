# Make sure it matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.2.0
FROM ruby:${RUBY_VERSION}-alpine

# Install libvips for Active Storage preview support
RUN apk add --no-cache build-base \
                       libxml2-dev \
                       libxslt-dev \
                       mariadb-dev \
                       git \
                       tzdata \
                       nodejs yarn \
                       less \
                       bash \
                       docker \
                       docker-compose \
    && mkdir /node_modules

# Rails app lives here
WORKDIR /app

# Set production environment
ARG RAILS_ENV="production"

ENV RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true" \
    RAILS_ENV="${RAILS_ENV}" \
    BUNDLE_PATH=/usr/local/bundle

RUN gem update --system && \
    gem install bundler

COPY Gemfile* .
RUN bundle install
RUN gem install rails

RUN echo "--modules-folder /node_modules" > .yarnrc
COPY package.json *yarn* ./
RUN yarn install

ENV BINDING="0.0.0.0"
EXPOSE 3000

CMD ["bash"]