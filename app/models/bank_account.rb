class BankAccount < ActiveRecord::Base
  belongs_to :user
  has_many :salaries
  has_many :expenses

  validates_presence_of :name

  def self.find_with_balance(id)
    self.includes(:expenses, :salaries).find(id) rescue nil
  end

  def processed_balance
    self.balance.to_s.reverse.scan(/.{1,3}/).join('.').reverse
  end

  def total_salaries sd, ed
    self.salaries.where(created_at: [sd..ed]).pluck(:amount).reduce(:+) || 0
  end

  def total_expenses sd, ed
    self.expenses.where(created_at: [sd..ed]).pluck(:amount).reduce(:+) || 0
  end
end
