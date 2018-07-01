class Expense < ActiveRecord::Base
  belongs_to :bank_account
  belongs_to :category
  # belongs_to :user, :through => :bank_account

  validates_presence_of :name
  validates_presence_of :bank_account_id

  after_create :update_balance
  after_destroy :add_to_account

  def update_balance
    balance = self.bank_account.balance
    self.bank_account.update(balance: balance - self.amount)
  end

  def add_to_account
    balance = self.bank_account.balance
    self.bank_account.update(balance: balance + self.amount)
  end

  def self.total
    self.pluck(:amount).reduce(:+) || 0
  end

  def self.processed_total
    self.total.to_s.reverse.scan(/.{1,3}/).join('.').reverse
  end

  def processed_ammount
    self.amount.to_s.reverse.scan(/.{1,3}/).join('.').reverse
  end
end
