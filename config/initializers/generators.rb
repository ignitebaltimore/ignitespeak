Rails.application.config.generators do |g|
  g.test_framework = :rspec
  g.view_specs false
  g.helper_specs false
  g.stylesheet_engine :sass
  g.javascript_engine :js
  g.template_engine :haml
end
