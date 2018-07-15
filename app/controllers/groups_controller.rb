class GroupsController < ApplicationController

  before_action :set_group, only: [:accept_invitation, :show, :invite_users, :send_invitation]
  before_action :authorize_resource, except: [:accept_invitation]

  def index

  end

  def new
    @group = Group.new
    respond_to do |format|
      format.js
    end
  end

  def show
  end

  def create
    @group = Group.new group_params
    @group.user_owner = current_user.id
    if @group.save
      users = params[:users_to_invite].split(',')
      users.each { |username| @group.invite_to_user(username) }
    end

    respond_to do |format|
      format.js
    end
  end

  def accept_invitation
    user = User.find(params[:user_id])
    user.group_id = @group.id
    if user.save
      GroupsNotificationWorker.perform_async('accept_invitation', user.id, @group.id)
    end
    redirect_to @group, notice: "Te has inscrito al grupo"
  end

  def invite_users
  end

  def send_invitation
    respond_to do |format|
      users = params[:users_to_invite].split(',')
      names = @group.users.pluck(:username)
      users.each { |username| @group.invite_to_user(username) unless names.include?(username) }
      format.js
    end
  end

  private

  def authorize_resource
    authorize!(params[:action].to_sym, @group || Group)
  end

  def group_params
    params.require(:group).permit(:name)
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
