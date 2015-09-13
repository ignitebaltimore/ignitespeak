source "https://rubygems.org"
ruby "2.2.2"

gem "rails", ["> 4.0","< 4.1"]
gem "jquery-rails"
gem "unicorn"
gem "haml-rails"
gem "foreigner"
gem "subelsky_power_tools"
gem "dim"
gem "simple_form"
gem "bootstrap-sass"
gem "table_for_collection"
gem "domino"
gem "filepicker-rails"
gem "exception_notification"
gem "rails_admin"
gem "dotenv-rails"
gem "sqlite3", require: true

group :assets do
  gem "sass-rails"
  gem "coffee-rails"
  gem "uglifier"
end

group :development do
  gem "foreman"
  gem "annotate"
end

group :development, :test do
  gem "rspec-rails"
  gem "database_cleaner"
  gem "capybara"
  gem "shoulda-matchers"
  gem "launchy"
end

group :test do
  gem "factory_girl_rails"
  gem "rspec-instafail"
  gem "codeclimate-test-reporter", require: nil
end

group :production do
  # Right now we use Postgres on Heroku, but we switched the dev/test environment
  # to sqlite to make things easier for contributors. Eventually we can migrate
  # production over, as this is not a high-performance app by any means. sqlite
  # is more than adequate.
  gem "pg"
  gem "rails_12factor"
end
