Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:2000'
    resource '*', headers: :any, methods: [:get, :post]
  end
end
