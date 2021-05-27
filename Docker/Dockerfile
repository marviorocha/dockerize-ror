FROM ruby:2.7.2-alpine
LABEL maintainer="Marvio Rocha"

ENV BUNDLER_VERSION=2.0.2

RUN apk add --update --no-cache \
    binutils-gold \
    build-base \
    curl \
    file \
    g++ \
    gcc \
    git \
    less \
    libstdc++ \
    libffi-dev \
    libc-dev \ 
    linux-headers \
    libxml2-dev \
    libxslt-dev \
    libgcrypt-dev \
    make \
    netcat-openbsd \
    nodejs \
    openssl \
    pkgconfig \
    postgresql-dev \
    tzdata \
    yarn \
    imagemagick \
    graphicsmagick-dev \
    ruby-dev \
    musl-dev 

RUN gem install bundler
ENV HOME /home/awesomeapp

WORKDIR $HOME

COPY Gemfile Gemfile.lock .env ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install 

RUN yarn install --check-files

RUN gem install rubocop

RUN apk update


COPY . ./ 


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh


# create credentials if put in productions

#EDITOR="vi --wait" bin/rails credentials:edit
#ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server"]