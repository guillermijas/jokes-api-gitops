require "rack/test"
require_relative "../app.rb"

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

describe App do
  context "GET /" do
    let(:app)      { App.freeze }
    let(:response) { get "/" }

    it { expect(response.status).to eq 302 }
  end

  context "GET /joke" do
    let(:app)      { App.freeze }
    let(:response) { get "/joke" }
    
    it { expect(response.status).to eq 200 }
  end
end
