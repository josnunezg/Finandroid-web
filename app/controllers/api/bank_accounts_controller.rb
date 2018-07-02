class Api::BankAccountsController < Api::ApplicationController

  def index
    render json: {bank_accounts: @user.bank_accounts.all }
  end

end
