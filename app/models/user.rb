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
  has_many :summaries

  scope :to_groups, ->(id) { where.not(id: id) }

  before_save :assign_uuid, if: Proc.new{ |u| u.uuid.blank? }

  before_destroy :destroy_all_childrens
  before_destroy :update_group
  # Muestra el nombre completo
  def full_name
    "#{first_name} #{last_name}"
  end

  def assign_uuid
    self.uuid = SecureRandom.uuid.gsub("-","")
  end

  def my_group
    Group.find_by(user_owner: self.id)
  end

  def destroy_all_childrens
    self.bank_accounts.destroy_all
    self.categories.destroy_all
    self.summaries.destroy_all
  end

  def update_group
    return unless self.group
    group = self.group
    return if group.user_owner != self.id
    group.destroy if group.user_ids.count == 1
    return unless self.group
    owner = (group.user_ids - [self.id]).first
    group.update(user_owner: owner)
  end
end
