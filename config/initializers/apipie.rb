Apipie.configure do |config|
  config.app_name                = "CDMan"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/api/docs"
  config.default_version         = "v1"
  config.copyright               = "&copy; 2015 CDMan by djtsheps"
  config.app_info                = "This is a CD Management Application REST API"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.validate                = false
end
