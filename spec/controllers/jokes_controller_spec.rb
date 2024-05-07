# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JokesController, type: :controller do
  describe 'GET #random' do
    context 'when the API call is successful' do
      it 'returns a successful response and the joke data' do
        fake_joke = {
          'id' => '12345',
          'url' => 'https://api.chucknorris.io/jokes/12345',
          'value' => 'Chuck Norris joke'
        }
        allow(RestClient).to receive(:get).and_return(double(body: fake_joke.to_json))

        get :random
        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)

        expect(json_response['id']).to eq('12345')
        expect(json_response['url']).to eq('https://api.chucknorris.io/jokes/12345')
        expect(json_response['value']).to eq('Chuck Norris joke')
      end
    end

    context 'when the API call fails' do
      it 'returns an error response' do
        allow(RestClient).to receive(:get).and_raise(RestClient::ExceptionWithResponse.new(nil, 503))

        get :random
        expect(response).to have_http_status(503)
        json_response = JSON.parse(response.body)

        expect(json_response['error']).to be_present
      end
    end

    context 'when the joke data is invalid' do
      it 'returns an error response' do
        allow(RestClient).to receive(:get).and_return(double(body: 'invalid JSON'))

        get :random
        expect(response).to have_http_status(500)
        json_response = JSON.parse(response.body)

        expect(json_response['error']).to be_present
      end
    end

    it 'returns the correct joke data' do
      fake_joke = {
        'id' => '12345',
        'url' => 'https://api.chucknorris.io/jokes/12345',
        'value' => 'Chuck Norris joke'
      }
      allow(RestClient).to receive(:get).and_return(double(body: fake_joke.to_json))

      get :random
      json_response = JSON.parse(response.body)

      expect(json_response).to eq(fake_joke)
    end

    it 'calls the fetch_joke method' do
      expect(controller).to receive(:fetch_joke).and_return({})

      get :random
    end

    it 'rescues from RestClient::ExceptionWithResponse and renders an error' do
      allow(RestClient).to receive(:get).and_raise(RestClient::ExceptionWithResponse.new(nil, 503))

      get :random
      expect(response).to have_http_status(503)
      json_response = JSON.parse(response.body)

      expect(json_response['error']).to be_present
    end

    it 'rescues from StandardError and renders an error' do
      allow(RestClient).to receive(:get).and_raise(StandardError.new('An error occurred'))

      get :random
      expect(response).to have_http_status(500)
      json_response = JSON.parse(response.body)

      expect(json_response['error']).to be_present
    end
  end
end
