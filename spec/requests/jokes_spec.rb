require 'rails_helper'

RSpec.describe 'Jokes API', type: :request do
  describe 'GET /random-joke' do
    context 'when the external API call is successful' do
      before do
        stub_request(:get, "https://api.chucknorris.io/jokes/random")
          .to_return(status: 200, body: { value: "Chuck Norris once repurposed an old baby chair into a four legged Ninja flying death spear." }.to_json, headers: { 'Content-Type' => 'application/json' })
      end

      it 'returns a random joke' do
        get '/random-joke'
        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response).to have_key('value')
        expect(json_response['value']).to eq('Chuck Norris once repurposed an old baby chair into a four legged Ninja flying death spear.')
      end
    end

    context 'when the external API call fails' do
      before do
        stub_request(:get, "https://api.chucknorris.io/jokes/random")
          .to_return(status: 500, body: "Internal Server Error")
      end

      it 'returns an error message' do
        get '/random-joke'
        expect(response).to have_http_status(:service_unavailable)
        json_response = JSON.parse(response.body)
        expect(json_response).to have_key('error')
        expect(json_response['error']).to eq("Failed to fetch joke: 809: unexpected token at 'Internal Server Error'")
      end
    end
  end
end
