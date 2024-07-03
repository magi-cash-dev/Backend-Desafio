class JokesController < ApplicationController
  def random_joke
    response = HTTParty.get('https://api.chucknorris.io/jokes/random')

    if response.success?
      joke = response.parsed_response
      render json: { joke: joke['value'] }
    else
      render json: { error: 'Failed to fetch joke from external API' }, status: :bad_gateway
    end
  end
end
