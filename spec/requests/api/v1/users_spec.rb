require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  describe 'POST /api/v1/users/signup' do
    subject { post '/api/v1/users/signup', headers:, params:, as: :json }

    let(:headers) do
      {
        'Content-Type' => 'application/json',
        'Os_Type' => 'ios',
        'X-Device-ID' => 'test_device_id'
      }
    end
    let(:params) do
      {
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      }
    end

    context '正常系' do
      it 'レコードを作成し、トークンを返すこと' do
        aggregate_failures do
          expect { subject }.to(
            change(User, :count).by(1)
            .and(change(Device, :count).by(1))
          )
          expect(response).to have_http_status(201)
          expect(response.parsed_body['user']['email']).to eq('test@example.com')
          expect(response.parsed_body['token']).to be_a(String)
        end
      end
    end
  end
end
