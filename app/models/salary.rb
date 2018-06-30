class Salary < ActiveRecord::Base
  belongs_to :bank_account
  # belongs_to :user, :through => :bank_account

  validates_presence_of :name
  validates_presence_of :amount
  validates_presence_of :bank_account_id

  after_create :update_balance

  def update_balance
    balance = self.bank_account.balance
    self.bank_account.update(balance: balance + amount)
  end

  def self.total
    self.pluck(:amount).reduce(:+) || 0
  end
end
