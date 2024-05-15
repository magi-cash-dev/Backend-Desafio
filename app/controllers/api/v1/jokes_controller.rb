class Api::V1::JokesController < ApplicationController
    def random_joke
        joke = RandomJokeService.call
        render json: { joke: joke }
    rescue StandardError => e
        render json: { error: e.message }, status: :service_unavailable
    end
end
