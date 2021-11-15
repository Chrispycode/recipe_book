FROM ruby:3.0.2

# Ensure latest packages for Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=true apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -yqq && apt-get install -yqq --no-install-recommends \
      nodejs \
      yarn

WORKDIR /usr/src/app

COPY ./Gemfile* ./
COPY ./package.json ./

RUN bundle install
RUN yarn install

COPY ./ ./

ENTRYPOINT ["./docker-entrypoint.sh"]
