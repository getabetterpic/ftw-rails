class ApplicationController < JSONAPI::ResourceController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_filter :restrict_access

  def current_user
    authenticate_or_request_with_http_token do |token, options|
      Person.find_by(email: options[:email], authentication_token: token)
    end
  end

  private
  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      Person.find_by(email: options[:email], authentication_token: token)
    end
  end
end
