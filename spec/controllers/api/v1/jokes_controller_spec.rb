# spec/controllers/api/v1/jokes_controller_spec.rb

require 'rails_helper'

RSpec.describe Api::V1::JokesController, type: :controller do
  describe "GET #random" do
    before do
      @base_url = 'https://api.chucknorris.io/jokes/random'
    end

    context "when the external API call is successful" do
      before do
        joke_response = {
          "value" => "Chuck Norris can divide by zero."
        }
        stub_request(:get, @base_url)
          .to_return(status: 200, body: joke_response.to_json, headers: { 'Content-Type' => 'application/json' })
      end

      it "returns a random joke" do
        get :random
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(json_response['joke']).to eq("Chuck Norris can divide by zero.")
      end
    end

    context "when the external API call fails" do
      before do
        stub_request(:get, @base_url)
          .to_return(status: 503)
      end

      it "returns a service unavailable status" do
        get :random
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:service_unavailable)
        expect(json_response['error']).to eq("Failed to fetch joke")
      end
    end

    context "when there is an exception" do
      before do
        allow(HTTParty).to receive(:get).and_raise(StandardError.new("Something went wrong"))
      end

      it "returns an internal server error status" do
        get :random
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:internal_server_error)
        expect(json_response['error']).to eq("Something went wrong")
      end
    end
  end
end

