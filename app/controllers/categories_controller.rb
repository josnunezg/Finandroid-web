class CategoriesController < ApplicationController

  before_action :set_category, only: [:edit, :update, :destroy]
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

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      @category.update category_params
      format.js
    end
  end

  def destroy
    respond_to do |format|
      @category.destroy
      format.js
    end
  end


  private

  def set_category
    @category = Category.find(params[:id])
  end

  def authorize_resource
    authorize!(params[:action].to_sym, @category || Category)
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
