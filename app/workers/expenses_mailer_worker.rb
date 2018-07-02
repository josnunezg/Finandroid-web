class ExpensesMailerWorker
  include Sidekiq::Worker

  def perform(expense_id, user_id)
    expense = Expense.find_by_id(expense_id)
    user = User.find_by_id(user_id)
    ExpensesMailer.new_expense(expense, user).deliver if user && expense
  end
end
