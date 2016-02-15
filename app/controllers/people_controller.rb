class PeopleController < JSONAPI::ResourceController
  def create
    attributes = params[:data][:attributes]
    email = attributes[:email]
    password = attributes[:password]
    password_confirmation = attributes['password-confirmation']
    person = Person.new(email: email, password: password, password_confirmation: password_confirmation)
    if person.save
      render json: person, status: 201 and return
    else
      render json: person, status: 422 and return
    end
  end
end
