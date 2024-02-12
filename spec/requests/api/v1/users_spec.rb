require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user) { users.first }
  let(:valid_headers) {
    { hello: "world" }
  }

  describe "GET /index" do
    before do
      token = auth_token_for_user(user)
      get api_v1_users_path, headers: { 'Authorization' => "Bearer #{token}" }
    end

    it "returns a success response" do
      expect(response).to have_http_status(:ok)
    end

    it "returns a list of users" do
      expect(json_response['users']['data']).not_to be_empty
      expect(json_response['users']['data'].size).to eq(User::PER_PAGE)
    end

    it "returns pagination metadata" do
      expect(json_response['pagination']).to include("items", "position", "has_more")
    end
  end
end

def json_response
  JSON.parse(response.body)
end
