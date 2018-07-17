class BankAccount < ActiveRecord::Base
  belongs_to :user
  has_many :salaries
  has_many :expenses

  validates_presence_of :name

  before_destroy :destroy_expenses_and_salaries

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

  def expenses_average
    expenses.sum(:amount) / expenses.count
  end

  def expenses_standard_deviation
    average = expenses_average
    count = expenses.count
    return unless count > 1
    sum = expenses.pluck(:amount).map { |amount| (amount - average)**2 }.reduce(:+)
    deviation = sum / (count - 1)
    deviation **= 0.5
    deviation
  end

  def destroy_expenses_and_salaries
    self.salaries.destroy_all
    self.expenses.destroy_all
  end
end
