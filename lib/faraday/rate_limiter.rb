module Faraday
  class RateLimiter < Faraday::Middleware
    def initialize(app, options={})
      super(app)
      @interval = options.fetch(:interval, 1)
      @last_request_time = nil
    end

    def call(env)

      if @last_request_time
        seconds_since_last_request = Time.now - @last_request_time
        if seconds_since_last_request < @interval
          sleep(@interval-seconds_since_last_request)
        end
      end

      @last_request_time = Time.now

      @app.call(env)
    end
  end
end

Faraday::Request.register_middleware :rate_limiter => Faraday::RateLimiter
