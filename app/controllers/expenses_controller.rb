class ExpensesController < ApplicationController

  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  def index
    @expenses = current_user.expenses.includes(:bank_account, :category)
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  def new
    @expense = Expense.new
    respond_to do |format|
      format.js
    end
  end

  def create
    respond_to do |format|
      @expense = Expense.new expense_params
      @expense.save
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      @expense.update(expense_params)
      format.js
    end
  end

  def destroy
    respond_to do |format|
      @expense.destroy
      format.js
    end
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :description, :bank_account_id,
                                    :category_id, :amount)
  end

end
