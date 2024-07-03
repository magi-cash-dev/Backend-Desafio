class Api::V1::JokesController < ApplicationController
  def random
    response = HTTParty.get('https://api.chucknorris.io/jokes/random')

    if response.success?
      render json: { joke: response['value'] }, status: :ok
    else
      render json: { error: 'Failed to fetch joke' }, status: :service_unavailable
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end
end
