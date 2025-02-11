class ExpensesController < ApplicationController
  before_action :find_expense, only: %i[edit update delete]

  def index
    @expenses = Expense.all.reorder(:date)
  end

  def new
    @expense = Expense.new
  end

  def create
    if @expense = Expense.create(**permitted_attributes, category_id: params[:expense][:category_id], user_id: User.last.id)
      redirect_to expenses_path
    else
      redirect_to expenses_path, error: 'Error while creating Expense'
    end
  end

  def edit; end

  def update
    if @expense.update(permitted_attributes)
      redirect_to expenses_path
    else
      redirect_to edit_expense_path(@expense.id), error: 'Error while updating Expense'
    end
  end

  def delete
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
    params.require(:expense).permit(:amount, :date, :category_id, :description)
  end
end
