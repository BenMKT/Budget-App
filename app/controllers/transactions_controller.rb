class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_category, only: %i[index new create]

  def index
    @transactions = @category.transactions.order(created_at: :desc)
    @total_amount = @transactions.sum(:amount)
  end

  def new
    @transaction = @category.transactions.build
    @categories = current_user.categories
  end

  def create
    # Get the category from the form submission instead of the instance variable
    selected_category = Category.find(params[:transaction][:category_id])

    # Build the transaction under the selected category
    @transaction = selected_category.transactions.build(transaction_params)

    if @transaction.save
      # Redirect to the transactions page for the selected category
      redirect_to category_transactions_path(selected_category), notice: 'Transaction was successfully created.'
    else
      # If there are errors, render the form again
      render :new
    end
  end

  private

  def find_category
    @category = current_user.categories.find(params[:category_id])
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :category_id)
  end
end
