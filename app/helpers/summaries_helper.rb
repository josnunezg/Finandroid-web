module SummariesHelper

  def trackable_list
    [
      BankAccount,
      Category
    ].collect { |model| [model.model_name.human(count: 2), model.to_s] }
  end

end
