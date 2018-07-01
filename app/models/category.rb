class Category < ActiveRecord::Base
  belongs_to :user
  has_many :expenses

  validates_presence_of :name

end
