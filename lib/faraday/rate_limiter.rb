module Faraday
  class RateLimiter < Faraday::Middleware

    VERSION = '0.0.1'

    def initialize(app, options={})
      super(app)
      @interval = options.fetch(:interval, 1)
      @last_request_time = Time.now
    end

    def call(env)

      time_since_last_request = Time.now - @last_request_time

      if time_since_last_request < @interval
        sleep(@interval-time_since_last_request)
      end
      @last_request_time = Time.now

      @app.call(env)
    end
  end
end

if Faraday::Request.respond_to? :register_middleware
  Faraday::Request.register_middleware :rate_limiter => Faraday::RateLimiter
end