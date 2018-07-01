class Summary < ActiveRecord::Base
  belongs_to :user

  def can_watch usr
    self.user.group.user_ids.includes(usr.id) && self.share
  end
end
