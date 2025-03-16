# frozen_string_literal: true

class ExpensesController < ApplicationController
  before_action :find_expense, only: %i[edit update destroy]

  def index
    @expenses = Expense.reorder(:date)
  end

  def new
    @expense = Expense.new
  end

  def edit; end

  def create
    if (@expense = Expense.create(**permitted_attributes, category_id: params[:expense][:category_id],
                                                          user_id: User.last.id))
      redirect_to expenses_path
    else
      redirect_to expenses_path, error: 'Error while creating Expense'
    end
  end

  def update
    if @expense.update(permitted_attributes)
      redirect_to expenses_path
    else
      redirect_to edit_expense_path(@expense.id), error: 'Error while updating Expense'
    end
  end

  def destroy
    if @expense.destroy
      redirect_to expenses_path
    else
      redirect_to expenses_path, error: 'Error while deleting Expense'
    end
  end

  private

  def find_expense
    @expense = Expense.find(params[:id])
  end

  def permitted_attributes
    params.expect(expense: %i[amount date category_id description])
  end
end
