class GroupsController < ApplicationController

  before_action :authorize_resource

  def index

  end

  private

  def authorize_resource
    authorize!(params[:action].to_sym, @group || Group)
  end

end
