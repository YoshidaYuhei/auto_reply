require 'rails_helper'

RSpec.describe 'HealthChecks', type: :request do
  describe 'GET /api/v1/health_checks' do
    before do
      FactoryBot.create(:health_check)
    end

    it 'returns a 200 status code' do
      get '/api/v1/health_checks'
      expect(response).to have_http_status(200)
      expect(response.parsed_body['message']).to eq('OK')
    end
  end
end
