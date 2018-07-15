class Group < ActiveRecord::Base

  has_many :users
  before_save :add_user_owner_to_group
  after_create :notification_create
  before_destroy :group_null


  def host_user
    User.find_by_id(self.user_owner)
  end

  def add_user_owner_to_group
    self.user_ids = [user_owner]
  end

  def notification_create
    GroupsNotificationWorker.perform_async('create_group', self.user_owner, self.id)
  end

  def invite_to_user username
    user = User.find_by_username(username)
    GroupsNotificationWorker.perform_async('invite_to_group', user.id, self.id) if user
  end

  def group_null
    self.users.each do |u|
      u.group = nil
      u.save
    end
  end
end
