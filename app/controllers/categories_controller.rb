class CategoriesController < ApplicationController

  before_action :authorize_resource

  def index
    @categories = Category.where(user_id: [current_user.id, nil])
  end


  private

  def authorize_resource
    authorize!(params[:action].to_sym, @category || Category)
  end

end
