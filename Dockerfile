## Version: 0.3
FROM centos:centos6
MAINTAINER Anton Bugreev <anton@bugreev.ru>

## install dependencies
RUN curl --silent --location https://rpm.nodesource.com/setup | bash - && \
    yum install git curl which tar patch libyaml-devel glibc-headers autoconf gcc-c++ glibc-devel patch readline-devel zlib-devel libffi-devel openssl-devel bzip2 automake libtool bison sqlite-devel nodejs -y

## add user
RUN useradd vukor -u 1000 -g 50
USER vukor
WORKDIR /home/vukor

## install rvm
RUN curl -sSL https://rvm.io/mpapis.asc | gpg2 --import - && \
    curl -L https://get.rvm.io | bash -s stable --ruby=1.9.3

## install ruby
RUN /bin/bash -c "source $HOME/.rvm/scripts/rvm && \
    rvm use 1.9.3 && \
    rvm rubygems latest"

## build gems
COPY ./docker-gemfile /tmp/Gemfile
COPY ./docker-gemfile.lock /tmp/Gemfile.lock
RUN /bin/bash -c "source $HOME/.rvm/scripts/rvm && \
    cd /tmp/ && \
    gem install bundler && \
    bundle install"

### volumes
VOLUME ["/home/vukor/blog/"]

## Test image
COPY ./test.sh /home/vukor/test.sh
RUN chmod 700 /home/vukor/test.sh

### main
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["ruby"]

### allow ports
EXPOSE 4000
