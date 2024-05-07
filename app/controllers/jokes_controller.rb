# frozen_string_literal: true

# Controller responsável por gerenciar piadas
class JokesController < ApplicationController
  api :GET, '/random', 'Busca na api do chucknorris uma piada aleatória'
  param :id, String, desc: 'ID da piada'
  param :url, String, desc: 'URL da piada'
  param :value, String, desc: 'Texto da piada'

  def random
    joke_data = fetch_joke

    render json: joke_params(joke_data), status: :ok
  rescue RestClient::ExceptionWithResponse => e
    render json: { error: "Failed to fetch a joke. Error: #{e.message}" }, status: e.http_code
  rescue StandardError => e
    render json: { error: "An unexpected error occurred: #{e.message}" }, status: 500
  end

  private

  def fetch_joke
    response = RestClient.get('https://api.chucknorris.io/jokes/random')
    JSON.parse(response.body)
  end

  def joke_params(joke_data)
    {
      id: joke_data['id'],
      url: joke_data['url'],
      value: joke_data['value']
    }
  end
end
