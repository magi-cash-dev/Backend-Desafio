# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JokesController, type: :controller do
  let(:payload) do
    '{"categories":[],
     "created_at":"2020-01-05 13:42:24.40636",
     "icon_url":"https://api.chucknorris.io/img/avatar/chuck-norris.png",
     "id":"BD9ZRRr6She8TI-H-F1yzA",
     "updated_at":"2020-01-05 13:42:24.40636",
     "url":"https://api.chucknorris.io/jokes/BD9ZRRr6She8TI-H-F1yzA",
     "value":"Everyone wonders what caused the Big Bang. Chuck Norris."}'
  end

  before { allow(Faraday).to receive(:get).and_return(joke_response) }

  let(:joke_response) { double(body: payload, success?: true) }

  it 'Should return the value of a random joke successfully' do
    get :random

    expect(response).to have_http_status(:ok)
    expect(response.body).to eq('Everyone wonders what caused the Big Bang. Chuck Norris.')
  end

  describe 'Unsuccessful requests' do
    let(:joke_response) { double(body: payload, success?: false) }

    it 'Should throw ExternalApiError with a service_unavailable response' do
      get :random

      expect(response).to have_http_status(:service_unavailable)
    end

    it 'Should throw Faraday::Error with a bad_request response' do
      allow(Faraday).to receive(:get).and_raise(Faraday::Error)

      get :random

      expect(response).to have_http_status(:bad_request)
    end
  end
end
