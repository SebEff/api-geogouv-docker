Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://mylocalredis:6379/0'}
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://mylocalredis:6379/0' }
end

require 'net/http'
require "byebug"
