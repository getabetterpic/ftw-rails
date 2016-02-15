class AccountsController < ApplicationController
  skip_before_filter :ensure_correct_media_type
  def create
    username = params[:username]
    bank_code = params[:bankCode]
    user = Plaid.add_user('auth', username, params[:password], bank_code)
    if user.api_res == 'success'
      accounts = current_user.create_accounts(user.accounts, user.access_token)
      if accounts.present?
        render json: accounts, status: 200 and return
      else
        render json: user.errors, status: 422 and return
      end
    else
      render json: user, status: 201 and return
    end
  end

  def mfa
    answer = params[:mfa]
    access_token = params[:access_token]
    user = Plaid.set_user(access_token)
    if user.api_res.empty?
      account = current_user.accounts.create(username: username, bank_code: bank_code)
      render json: user, status: 200 and return
    else
      user.mfa_authentication(answer)
      render json: user, status: 201 and return
    end
  end
end
