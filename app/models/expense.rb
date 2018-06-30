class Expense < ActiveRecord::Base
  belongs_to :bank_account
  belongs_to :category
  # belongs_to :user, :through => :bank_account
end
