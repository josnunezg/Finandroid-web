class GroupsNotificationMailer < ApplicationMailer

  def create_group(user, group)
    @user = user
    @group = group
    mail to: @user.email, subject: 'Grupo creado' if @user && @group
  end

  def invite_to_group(user, group)
    @user = user
    @group = group
    @host = @group.host_user if @group
    mail to: @user.email, subject: 'Invitación a grupo' if @user && @group
  end

end
