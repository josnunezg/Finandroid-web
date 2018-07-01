class SalariesController < ApplicationController

  before_action :set_salary, only: [:show, :edit, :update, :destroy]

  def index
    @salaries = current_user.salaries.includes(:bank_account)
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  def new
    @salary = Salary.new
    respond_to do |format|
      format.js
    end
  end

  def create
    respond_to do |format|
      @salary = Salary.new salary_params
      @salary.save
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
      @salary.update(salary_params)
      format.js
    end
  end

  def destroy
    respond_to do |format|
      @salary.destroy
      format.js
    end
  end

  private

  def set_salary
    @salary = Salary.find(params[:id])
  end

  def salary_params
    params.require(:salary).permit(:name, :description, :bank_account_id,
                                   :amount)
  end

end
