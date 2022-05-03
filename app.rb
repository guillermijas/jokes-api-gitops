require "roda"
require "http"

class App < Roda
  route do |r|
    # /
    r.root do
      r.redirect "/docs"
    end

    # /docs
    r.get "docs" do
      "Use /joke to get a random joke."
    end

    # /joke
    r.get "joke" do
      http = HTTP.get("http://api.icndb.com/jokes/random")
      joke = JSON.parse(http.body.to_s)["value"]["joke"]
      
      "Here's a joke: #{joke}"
    end
  end
end
