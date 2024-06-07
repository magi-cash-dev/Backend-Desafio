require 'rails_helper'

RSpec.describe '/random-joke', type: :request do
	def set_host (host)
    host! host
    Capybara.app_host = "http://#{host}"
  end

  before(:each) do
    set_host 'localhost:3000'
  end

	describe 'GET /random-joke' do
    it 'renders a successful response' do
      get '/random-joke', params: {}

      expect(response).to have_http_status(:success)
    end

    it 'renders a error response' do
      get '/random-joke', params: { category: 'NotExists' }

      expect(response).to have_http_status(503)
    end

    it 'renders a successful with category params' do
      get '/random-joke', params: { category: 'dev' }

      expect(response).to have_http_status(:success)
    end
  end
end
