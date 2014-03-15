ActionMailer::Base.smtp_settings = {
  address:               APP_CONFIG['email']['host'],
  port:                  APP_CONFIG['email']['port'],
  user_name:             APP_CONFIG['email']['user'],
  password:              APP_CONFIG['email']['password'],
  domain:                APP_CONFIG['email']['domain'],
  authentication:        APP_CONFIG['email']['auth'],
  enable_starttls_auto:  APP_CONFIG['email']['tls']
}

ActionMailer::Base.default_url_options[:host] = APP_CONFIG['hostname']