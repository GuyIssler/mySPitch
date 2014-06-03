#redis_uri = URI.parse(REDIS_URL)
#if Rails.env.staging? || Rails.env.production?
#  $redis = Redis.new(host: redis_uri.host, port: redis_uri.port, password: redis_uri.password)
#else
#  $redis = Redis.new(host: redis_uri.host, port: redis_uri.port)
#end

uri = URI.parse(ENV["REDISTOGO_URL"] || "redis://localhost:6379/")
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)