#!/usr/bin/env bash
set -ex
export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get install -y tzdata
gem install bundler -v 2.0.1
# before_install
gem update --system
gem update bundler
# install
bundle install --jobs=3 --retry=3
# before_script
bundle exec rake db:migrate RAILS_ENV=test
# script
rake
