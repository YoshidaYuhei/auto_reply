class Api::V1::BaseController < ApplicationController
  before_action :authenticate!
  attr_reader :current_user

  private

  def authenticate!
    header = request.headers['Authorization']
    return unauthorized_response unless header

    token = header.split(' ').last
    return unauthorized_response unless token

    begin
      decoded = JwtService.decode(token)
      return unauthorized_response unless decoded

      @_current_user = User.find(decoded['user_id'])
      binding.pry
    rescue ActiveRecord::RecordNotFound
      unauthorized_response
    end
  end

  def unauthorized_response
    render json: { error: '認証に失敗しました' }, status: :unauthorized
  end

  def current_user
    @_current_user
  end
end
