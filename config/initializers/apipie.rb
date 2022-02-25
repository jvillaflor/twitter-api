Apipie.configure do |config|
  config.app_name                = "Twitter Api"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/docs"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.app_info["1.0"] = "
    This is a code challenge for Caiena!
  "
  config.translate = false
end
