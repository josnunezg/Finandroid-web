class GroupsNotificationWorker
  include Sidekiq::Worker

  def perform(mail, user_id, group_id)
    user = User.find_by_id(user_id)
    group = Group.find_by_id(group_id)
    GroupsNotificationMailer.try(mail, user, group).deliver if user && group
  end
end
