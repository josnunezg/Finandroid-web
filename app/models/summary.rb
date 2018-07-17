class Summary < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :trackable

  def can_watch? usr
    self.user.group.user_ids.includes(usr.id) && self.share rescue false
  end

  def scope
    return unless self.trackable
    model = self.trackable.constantize
    user_search = [self.user_id]
    user_search << nil if model == Category
    model.where(user_id: user_search)
  end

  def data
    return scope.map {|s| [s.name, s.balance(user_id, start_date, end_date)]} if trackable == "Category"
    [
      {
        name: Salary.model_name.human(count: 2),
        data: scope.map { |s| [s.name, s.total_salaries(start_date, end_date)] }.to_h
      },
      {
        name: Expense.model_name.human(count: 2),
        data: scope.map { |s| [s.name, s.total_expenses(start_date, end_date)] }.to_h
      }
    ]
  end
end
