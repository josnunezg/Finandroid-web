class ExpensesMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.expenses_mailer.new_expense.subject
  #
  def new_expense expense, user
    @expense = expense
    @user = user
    mail to: @user.email, subject: 'Aviso nuevo gasto'
  end
end
