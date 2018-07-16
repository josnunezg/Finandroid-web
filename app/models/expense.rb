class Expense < ActiveRecord::Base
  belongs_to :bank_account
  belongs_to :category
  # belongs_to :user, :through => :bank_account

  validates_presence_of :name
  validates_presence_of :bank_account_id

  after_create :update_balance
  after_destroy :add_to_account
  after_create :send_notification

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

  def user
    self.bank_account.try('user')
  end

  def is_alertable?
    # Aqui esta la logica en base a la desviacion estandar de la cuenta
    deviation = bank_account.expenses_standard_deviation
    average = bank_account.expenses_average
    up = average + deviation.to_i
    deviation && amount > up
  end

  def send_notification
    ExpensesMailerWorker.perform_async(self.id, user.try(:id)) if self.is_alertable?
  end
end
