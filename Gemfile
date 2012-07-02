source "https://rubygems.org"
ruby '1.9.3'

gem "rails"
gem "pg"
gem "jquery-rails"
gem "unicorn"
gem "haml-rails"
gem "Empact-sexy_pg_constraints", require: "sexy_pg_constraints"
gem "foreigner"
gem "subelsky_power_tools"
gem "dim"
gem "simple_form"
gem "bootstrap-sass"
gem "table_for_collection"
gem "domino"

group :assets do
  gem "sass-rails"
  gem "coffee-rails"
  gem "uglifier"
end

group :development do
  gem "annotate", :git => "https://github.com/ctran/annotate_models.git"
end

group :development, :test do
  gem "rb-fsevent"
  gem "rspec-rails"
  gem "database_cleaner"
  gem "capybara"
  gem "shoulda-matchers"
  gem "launchy"
  gem "spork"
  gem "guard-spork"
  gem "guard-rspec"
  gem "rspec-instafail"
  gem "factory_girl", require: false
end
