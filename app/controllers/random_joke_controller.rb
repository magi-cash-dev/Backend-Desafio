class RandomJokeController < ApplicationController
	def index
		service = GetRandomJoke.call(index_params[:category])

		if service.success?
			render json: service.result, status: :ok
		else
			render json: { messages: service.try(:errors).try(:full_messages) }, status: 503
		end
	end

	private

  def index_params
    params.permit(
      :category
    )
  end
end
