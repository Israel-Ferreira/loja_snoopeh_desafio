# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '/snoopeh_store/*',
             headers: %w[Authorization],
             methods: :any,
             expose: %w[Authorization],
             max_age: 600
  end
end
