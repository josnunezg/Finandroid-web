module ApplicationHelper

  def items_sidebar
    [
      {
        model: BankAccount,
        icon: 'account_balance'
      },
      {
        model: Category,
        icon: 'bookmark'
      },
      {
        model: Salary,
        icon: 'attach_money'
      },
      {
        model: Expense,
        icon: 'money_off'
      },
      {
        model: Summary,
        icon: 'assessment'
      }
    ]
  end

  def active? model
    controller = model.to_s.underscore.pluralize
    return "cyan lighten-4" if controller == params[:controller]
    ""
  end

end
