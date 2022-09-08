class ApplicationController < ActionController::API

    rescue_from ActiveRecord::RecordNotFound, with: :not_found_resp
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_resp

    def not_found_resp data
        render json: {error: "#{data.model} not found"}, status: :not_found
        # render json: {error: data.message}, status: :not_found
    end

    def invalid_resp data
        render json: {errors: data.record.errors.full_messages}, status: :unprocessable_entity
    end

end
