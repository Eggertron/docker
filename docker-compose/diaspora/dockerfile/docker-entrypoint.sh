#!/bin/bash

echo "Create database"
RAILS_ENV=production bundle exec rake db:create db:migrate

echo "Compile assets"
RAILS_ENV=production bin/rake assets:precompile

"$@"
