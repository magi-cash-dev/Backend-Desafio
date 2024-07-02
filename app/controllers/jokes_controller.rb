# frozen_string_literal: true

class JokesController < ApplicationController
  class ExternalApiError < StandardError; end

  BASE_URL = 'https://api.chucknorris.io/jokes'

  def random
    response = Faraday.get("#{BASE_URL}/random")

    raise ExternalApiError unless response.success?

    render json: JSON.parse(response.body).fetch('value'), status: :ok
  rescue Faraday::Error => e
    render json: { error: e.message }, status: :bad_request
  rescue ExternalApiError
    render json: { error: 'Unresponsive External API' }, status: :service_unavailable
  end
end
