FROM ruby:2.5.7

RUN apt-get update -qq \
    && apt-get install -y \
        build-essential libpq-dev libnss3-dev nodejs \
        postgresql postgresql-client \
        netcat \
        imagemagick libvips libvips-dev libvips-tools

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs && npm install --global yarn

RUN npm config get registry prints: https://registry.npmjs.org

COPY Gemfile* /tmp/
WORKDIR /tmp
RUN gem install bundler
RUN bundle install

ENV app /app
RUN mkdir $app
WORKDIR $app

# Copy the main application.
COPY . ./

# Install and build javascript dependences
RUN yarn build

# Precompile Rails assets (plus Webpack)
RUN bundle exec rake assets:precompile

RUN chmod +x $app/bin/entrypoint.sh
CMD $app/bin/entrypoint.sh
