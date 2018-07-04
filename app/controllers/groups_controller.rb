class GroupsController < ApplicationController

  before_action :authorize_resource

  def index

  end

  def new
    @group = Group.new
    respond_to do |format|
      format.js
    end
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

  private

  def authorize_resource
    authorize!(params[:action].to_sym, @group || Group)
  end

  def group_params
    params.require(:group).permit(:name)
  end

end
