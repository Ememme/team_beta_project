class ExpensesController < ApplicationController
  before_action :authenticate_student!

  def new
    @expense = Expense.new();
  end

  def create
    @expense = Expense.new(expense_params)

    @expense.save
    redirect_to @article
  end

  def edit
  end

  def update
  end

  def index
    @expenses = current_student.expenses
  end

  def show
  end

  private

  def expense_params
    @params = params.require(:expense).permit(:owner_id, :price, :category)
  end
end
