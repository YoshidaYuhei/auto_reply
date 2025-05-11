module Api
  module V1
    class UsersController < BaseController
      skip_before_action :authenticate!, only: [ :create ]

      def create
        user = User.new(user_params)

        if user.save
          token = JwtService.encode(user_id: user.id)
          set_device(user)
          render json: {
            user: {
              id: user.id,
              email: user.email
            },
            token:
          }, status: :created
        else
          render json: {
            status: 'error',
            message: 'ユーザー登録に失敗しました',
            errors: user.errors.full_messages
          }, status: :bad_request
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end

      def set_device(user)
        return if request.headers['X-Device-ID'].blank?

        Device.create!(
          key: request.headers['X-Device-ID'],
          os_type: request.headers['Os_Type'],
          user:
        )
      end
    end
  end
end
