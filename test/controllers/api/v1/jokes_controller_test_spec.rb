require 'rails_helper'
require 'webmock/rspec'

RSpec.describe Api::V1::JokesController, type: :controller do
  describe 'GET #random_joke' do
    context 'when the request is successful' do
      before do
        stub_request(:get, "https://api.chucknorris.io/jokes/random")
          .to_return(status: 200, body: { value: "Chuck Norris can divide by zero." }.to_json, 
            headers: { 'Content-Type' => 'application/json' })

        get :random_joke
      end

      it 'returns a successful response' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns the joke in the response' do
        json_response = JSON.parse(response.body)
        expect(json_response['joke']).to eq("Chuck Norris can divide by zero.")
      end
    end

    context 'when the request fails' do
      before do
        stub_request(:get, "https://api.chucknorris.io/jokes/random")
          .to_return(status: 503)
        get :random_joke
      end

      it 'returns a service unavailable response' do
        expect(response).to have_http_status(:service_unavailable)
      end

      it 'returns the error message in the response' do
        json_response = JSON.parse(response.body)
        expect(json_response['error']).to eq('Não foi possível pegar uma frase de Chuck Norris.')
      end
    end
  end
end