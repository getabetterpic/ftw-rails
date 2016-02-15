class SessionsController < ApplicationController
  skip_before_filter :ensure_correct_media_type
  skip_before_filter :restrict_access
  def create
    person = Person.authenticate(params[:user][:email].downcase, params[:user][:password])
    data = {
      token: person.authentication_token,
      email: person.email
    }
    render json: data, status: 201 and return
  end
end
