class Category < ActiveRecord::Base
  belongs_to :user
  has_many :expenses

  validates_presence_of :name

  def balance usr_id, sd, ed
    self.expenses.includes(:bank_account)
                 .where(:"bank_accounts.user_id" => usr_id, created_at: [sd..ed])
                 .pluck(:amount).reduce(:+)
  end

end
