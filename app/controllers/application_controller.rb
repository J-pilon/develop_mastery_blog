class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound do |_exception|
      render file: 'public/404', status: :not_found
    end
end
