class AccountsController < ApplicationController
  skip_before_filter :restrict_access
  def sync

  end
end
