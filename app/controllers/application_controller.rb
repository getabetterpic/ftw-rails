class ApplicationController < JSONAPI::ResourceController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_filter :restrict_access

  def context
    {current_user: @current_user}
  end

  def current_user
    @current_user
  end

  private
  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      @current_user = Person.find_by(authentication_token: token)
      return false unless @current_user
      return true
    end
  end
end
