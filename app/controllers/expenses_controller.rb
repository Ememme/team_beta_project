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

  def pay
    @expense = Expense.find(params[:id])
    @contributor_expense = @expense.contributor_expenses.where(purchaser_id: current_student.id)
    @contributor_expense = true
    redirect_to @expense, alert: "The expense has been payed succesfully!"
  end

  def edit
  end

  def update
  end

  def index
    @expenses = current_student.expenses
    @purchases = Expense.where(purchaser_id: current_student.id)
  end

  def show
    @expense = Expense.find(params[:id])
  end

  private

  def expense_params
    @params = params.require(:expense).permit(:owner_id, :price, :category)
  end
end
