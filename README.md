# Faraday::RateLimiter

Faraday middleware to limit the rate of requests

## Installation

Add this line to your application's Gemfile:

    gem 'faraday-rate_limiter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install faraday-rate_limiter

## Usage

    require 'faraday-rate_limiter'

    Faraday.new do |conn|
      conn.request :rate_limiter, interval: 5 # Defaults to 1 second
      conn.adapter :net_http
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
