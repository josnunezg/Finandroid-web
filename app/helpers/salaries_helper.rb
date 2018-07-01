module SalariesHelper

  def bank_accounts_for_form
    current_user.bank_accounts.order(:name).collect { |bk| [bk.name, bk.id] }
  end

end
