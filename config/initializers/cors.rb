# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

# This handles cross-origin resource sharing.
# See: https://github.com/cyu/rack-cors
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # In development, we don't care about the origin.
    origins 'lvh.me', 'localhost:4200', 'logger.sebastiancamacho.com',
    /\Ahttp:\/\/192\.168\.0\.\d{1,3}(:\d+)?\z/,
    /\Ahttp:\/\/192\.168\.1\.\d{1,9}(:\d+)?\z/
    # regular expressions can be used here
    # Reminder: On the following line, the 'methods' refer to the 'Access-
    # Control-Request-Method', not the normal Request Method.
    resource '*', :headers => :any, :methods => [:get, :post, :options, :delete, :put, :patch], credentials: true
  end
end