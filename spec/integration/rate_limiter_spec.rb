require 'rspec'

require 'faraday'
require 'faraday-rate_limiter'

describe Faraday::RateLimiter do

  let(:interval) { 5 }
  let(:conn) do
    Faraday.new do |conn|
      conn.request :rate_limiter, interval: interval
      conn.adapter :test do |stub|
        stub.get('/index') {[ 200, {}, '' ]}
      end
    end
  end

  it 'should return the first result without delay' do
    t1 = Time.now
    conn.get('/index')
    t2 = Time.now
    expect((t2 - t1).abs < interval).to be_true
  end

  it 'should wait between requests' do
    t1 = Time.now
    conn.get('/index')
    conn.get('/index')
    t2 = Time.now
    expect((t2 - t1).abs > interval).to be_true
  end

end