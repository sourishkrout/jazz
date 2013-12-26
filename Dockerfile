FROM ubuntu:precise

MAINTAINER Sebastian Tiedtke version: 0.1

RUN \
  echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list ;\
  echo "deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu precise main" >> /etc/apt/sources.list ;\
  apt-get update ;\
  dpkg-divert --local --rename --add /sbin/initctl ;\
  ln -s /bin/true /sbin/initctl ;\
  apt-get install -y --force-yes libmysqlclient-dev python-dev python-pip nodejs mysql-server ;\
  pip install -U virtualenv ;\
  npm install -g bower grunt-cli ;\
  mysqld &
# END RUN
