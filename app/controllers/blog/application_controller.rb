module Blog
  class ApplicationController < ActionController::API
    def not_found_response(name)
      render json: { error: "#{name} does not exist" }, status: :not_found
    end

    def errors_response(element)
      render json: { errors: element.errors }, status: :bad_request
    end
  end
end
