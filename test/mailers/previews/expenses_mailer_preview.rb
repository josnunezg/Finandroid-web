# Preview all emails at http://localhost:3000/rails/mailers/expenses_mailer
class ExpensesMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/expenses_mailer/new_expense
  def new_expense
    ExpensesMailer.new_expense
  end

end
