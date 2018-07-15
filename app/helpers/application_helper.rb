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

  def icon model
    {
      bank_account: "account_balance",
      category: "bookmark",
      salary: "attach_money",
      expense: "money_off",
      summary: "assessment"
    }[model.to_s.underscore.to_sym]
  end

  def active? model
    controller = model.to_s.underscore.pluralize
    return "white z-depth-4" if controller == params[:controller]
    "white-text"
  end

  def active_icon? model
    controller = model.to_s.underscore.pluralize
    return "black-text" if controller == params[:controller]
    "white-text"
  end

end
