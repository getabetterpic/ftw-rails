class TransactionsController < ApplicationController
  skip_before_filter :restrict_access
end
