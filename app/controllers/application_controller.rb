class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_error

    private
    def render_error
    render json: {error: "#{controller_name.classify} was not found"}, status: 404 
    end
end
