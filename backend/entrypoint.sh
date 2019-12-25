#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
# rm -f /app/tmp/pids/server.pid

RAILS_ENV=production rails db:migrate
bundle exec puma -C config/puma.rb
