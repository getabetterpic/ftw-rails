class InstitutionsController < ApplicationController
  skip_before_filter :restrict_access
  def index
    fis = HTTParty.get('https://tartan.plaid.com/institutions')
    render json: fis.body, status: 200 and return
  end
end
