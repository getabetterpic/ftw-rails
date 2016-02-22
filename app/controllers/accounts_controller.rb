class AccountsController < ApplicationController
  skip_before_filter :ensure_correct_media_type
  def create
    username = params[:username]
    bank_code = params[:bankCode]
    user = Plaid.add_user('auth', username, params[:password], bank_code)
    if user.api_res == 'success'
      accounts = Account.create_plaid_accounts(current_user, user.accounts, user.access_token)
      transactions = Transaction.create_plaid_transactions(current_user, user.transactions)
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

  def link
    public_token = params[:public_token]
    exchange_request = Plaid.exchange_token(public_token)
    if private_token = exchange_request.access_token
      begin
        user = Plaid.set_user(private_token, ['connect'])
      rescue Plaid::NotFound, Plaid::Unauthorized
        user = Plaid.set_user(private_token, ['auth'])
      end
      accounts = Account.create_plaid_accounts(current_user, user.accounts, user.access_token)
      if user.get('connect')
        transactions = Transaction.create_plaid_transactions(current_user, user.transactions)
      end
    end
    render json: {}, status: 201 and return
  end
end
