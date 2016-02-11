class SessionsController < ApplicationController
  def create
    ap params
    person = Person.authenticate(params[:person][:email], params[:person][:password])
    data = {
      token: person.authentication_token,
      email: person.email
    }
    render json: data, status: 201 and return
  end
end
