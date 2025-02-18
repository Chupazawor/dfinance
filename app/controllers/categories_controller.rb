# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :find_category, only: %i[delete update edit]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    @categories = Category.for(User.last.id)
  end

  def edit; end

  def create
    if (@category = Category.create(**permitted_attributes, user_id: User.last.id, general: false))
      redirect_to expenses_path
    else
      redirect_to new_category_path, error: 'Error while creating Category'
    end
  end

  def update
    if @category.update(permitted_attributes)
      redirect_to new_category_path
    else
      redirect_to edit_category_path(@category.id), error: 'Error while updating Category'
    end
  end

  def delete
    if @category.destroy
      redirect_to category_path
    else
      redirect_to new_category_path, error: 'Error while deleting Category'
    end
  end

  private

  def permitted_attributes
    params.expect(category: [:name])
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
