module Api
  module V1
    class HealthChecksController < BaseController
      def index
        message = HealthCheck.first.message
        render json: { message: }
      end
    end
  end
end
