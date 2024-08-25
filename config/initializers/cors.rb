Rails.application.config.middleware.insert_before 0, Rack::Cors, debug: true, logger: (-> { Rails.logger }) do
  allow do
    origins 'staging.ebwiki.org'
    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head],
             :max_age => 0
  end
end
