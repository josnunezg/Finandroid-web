module ExpensesHelper

  def bank_accounts_for_form
    current_user.bank_accounts.order(:name).collect { |bk| [bk.name, bk.id] }
  end

  def categories_for_form
    Category.where(user_id: [current_user.id, nil])
            .order(:default).collect { |c| c.default ? [t("categories.#{c.name}"),c.id] : [c.name, c.id]}
  end

end
