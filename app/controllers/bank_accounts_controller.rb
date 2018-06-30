class BankAccountsController < ApplicationController

  before_action :set_bank_account, except: [:index, :new, :create]

  def index
    @bank_accounts = current_user.bank_accounts
    #render :new if @bank_accounts.empty?
  end

  def new
    @bank_account = current_user.bank_accounts.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @bank_account = current_user.bank_accounts.new(bank_account_params)
    respond_to do |format|
      if @bank_account.save
        format.js
      else
        format.js
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @bank_account.update(bank_account_params)
        format.js
      else
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @bank_account.destroy
        format.js
      else
        format.js
      end
    end
  end

  def show_balance
    @balance = BankAccount.find_with_balance(params[:id])
    respond_to do |format|
      format.js
    end
  end

  private

  def bank_account_params
    params.require(:bank_account).permit(:name)
  end

  def set_bank_account
    @bank_account = BankAccount.find(params[:id])
  end

end
