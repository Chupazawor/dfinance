class CategoriesController < ApplicationController
  def index 
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    if @category = Category.create(**permitted_attributes, user_id: User.last.id, general: false)
      redirect_to expenses_path
    else
      redirect_to new_category_path, error: 'Error while creating Category'
    end
  end

  private

  def permitted_attributes
    params.require(:category).permit(:name)
  end
end
