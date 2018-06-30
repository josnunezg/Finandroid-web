class Salary < ActiveRecord::Base
  belongs_to :bank_account
  # belongs_to :user, :through => :bank_account
end
