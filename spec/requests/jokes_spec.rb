require 'rails_helper'

RSpec.describe 'Random Joke API' do
  describe 'GET /random-joke' do
    let(:json_response) { response.parsed_body }
    let(:api_url) { 'https://api.chucknorris.io/jokes/random' }
    let(:api_body) { { value: 'Chuck Norris joke' }.to_json }
    let(:api_headers) do
      {
        'Accept' => '*/*',
        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent' => 'Ruby'
      }
    end

    context 'when the API call is successful' do
      before do
        stub_request(:get, api_url).with(headers: api_headers).to_return(status: 200, body: api_body)
        get '/random-joke'
      end

      it 'returns a successful response' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns a JSON response with a joke key' do
        expect(json_response).to have_key('joke')
      end

      it 'returns a joke value that is a string' do
        expect(json_response['joke']).to be_a(String)
      end

      it 'makes a request to the Chuck Norris API' do
        expect(WebMock).to have_requested(:get, api_url)
      end
    end

    context 'when the API call fails' do
      before do
        stub_request(:get, api_url).with(headers: api_headers).to_return(status: 500)
        get '/random-joke'
      end

      it 'returns a bad gateway response' do
        expect(response).to have_http_status(:bad_gateway)
      end

      it 'returns a JSON response with an error key' do
        expect(json_response).to have_key('error')
      end

      it 'returns a JSON response with an error message' do
        expect(json_response['error']).to eq('Failed to fetch joke from external API')
      end
    end
  end
end
