class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  belongs_to :group
  has_many :categories
  has_many :bank_accounts
  has_many :salaries, :through => :bank_accounts
  has_many :expenses, :through => :bank_accounts

  # Muestra el nombre completo
  def full_name
    "#{first_name} #{last_name}"
  end
end
