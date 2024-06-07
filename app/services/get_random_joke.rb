class GetRandomJoke
	prepend SimpleCommand
	
	def initialize(category = nil)
		@category = category
	end

	def call
		uri = URI('https://api.chucknorris.io/jokes/random')

		if @category
			params = { category: @category }
			uri.query = URI.encode_www_form(params)
		end

		request = Net::HTTP.get_response(uri)
	
		return errors.add(:request_api_error, JSON.parse(request.body).try(:[], 'message')) unless request.is_a?(Net::HTTPSuccess)

		JSON.parse(request.body)
	rescue => e
		errors.add(:error_get_random_joke, e.to_s)
	end
end