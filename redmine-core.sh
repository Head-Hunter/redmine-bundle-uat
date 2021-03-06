echo enable redmine core - current master

cd /vagrant/
git submodule update

rsync -a /vagrant/configs/database.yml ./redmine-core/config/

echo starting to bundle build

cd ./redmine-core

bundle install
bundle update

echo provisioning db and others

bundle exec rake generate_secret_token

RAILS_ENV=development bundle exec rake db:migrate
