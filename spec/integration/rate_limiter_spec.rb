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

  it 'returns the first result without delay' do
    t1 = Time.now
    conn.get('/index')
    t2 = Time.now
    expect((t2 - t1).abs < interval).to be_true
  end

  it 'waits between requests' do
    t1 = Time.now
    conn.get('/index')
    conn.get('/index')
    t2 = Time.now
    expect((t2 - t1).abs > interval).to be_true
    expect((t2 - t1).abs < interval*2).to be_true
  end

  it 'waits for correct time with long requests' do
    t1 = Time.now
    conn.get('/index')
    sleep(5)
    conn.get('/index')
    t2 = Time.now
    expect((t2 - t1).abs > interval).to be_true
    expect((t2 - t1).abs < interval*2).to be_true  end

end