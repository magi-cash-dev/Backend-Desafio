require 'net/http'
require 'json'

class JokesController < ApplicationController
  def random_joke
    url = URI('https://api.chucknorris.io/jokes/random')
    begin
      response = Net::HTTP.get(url)
      joke = JSON.parse(response)
      render json: joke
    rescue StandardError => e
      render json: { error: "Failed to fetch joke: #{e.message}" }, status: :service_unavailable
    end
  end
end
