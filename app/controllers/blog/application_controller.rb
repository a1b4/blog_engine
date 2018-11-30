module Blog
  class ApplicationController < ActionController::API
    def not_found_response(name)
      render json: { error: "#{name} does not exist" }, status: :not_found
    end
  end
end
