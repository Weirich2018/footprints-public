Rails.application.config.middleware.use OmniAuth::Builder do
  OmniAuth.config.logger = Rails.logger
  begin
    config      = Rails.root.join('config/omniauth.yml')
    credentials = YAML.load_file(config)
    provider :google_oauth2, credentials[Rails.env]["client_id"], credentials[Rails.env]["client_secret"]
  rescue Exception => e
    puts "OmniAuth configuration failed."
    puts e
    puts e.backtrace
  end
end
