require 'spec_helper'

require 'faraday'
require 'faraday-rate_limiter'

describe Faraday::RateLimiter do

  let(:interval) { 5 }
  let(:conn) do
    Faraday.new do |conn|
      conn.request :rate_limiter, :interval => interval
      conn.adapter :test do |stub|
        stub.get('/index') {[ 200, {}, '' ]}
      end
    end
  end

  it 'returns the first result without delay' do
    t1 = Time.now
    conn.get('/index')
    t2 = Time.now
    expect(t2 - t1).to be_within(0.1).of(0)
  end

  it 'waits between requests' do
    t1 = Time.now
    conn.get('/index')
    conn.get('/index')
    t2 = Time.now
    expect(t2 - t1).to be_within(0.1).of(interval)
  end

  it 'waits for correct time with long requests' do
    t1 = Time.now
    conn.get('/index')
    sleep(5)
    conn.get('/index')
    t2 = Time.now
    expect(t2 - t1).to be_within(0.1).of(interval)
  end

end