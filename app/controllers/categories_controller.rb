class CategoriesController < ApplicationController

  before_action :authorize_resource

  def index
    @categories = Category.where(user_id: [current_user.id, nil])
  end

  def new
    respond_to do |format|
      @category = current_user.categories.new
      format.js
    end
  end

  def create
    respond_to do |format|
      @category = current_user.categories.new category_params
      @category.save
      format.js
    end
  end


  private

  def authorize_resource
    authorize!(params[:action].to_sym, @category || Category)
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
