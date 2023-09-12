class ItemsController < ApplicationController
  def new
    @category = Category.includes(:user).find(params[:id])
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    @item.author = current_user

    flash[:notice] = if @item.save
                       'Created successfully'
                     else
                       'Failed to create!'
                     end
    redirect_to category_path(@item.category)
  end

  def destroy
    @item = Item.find(params[:id])
    @category = @item.category

    flash[:notice] = if @item.destroy
                       'Deleted successfully'
                     else
                       'Failed to delete!'
                     end
    redirect_to category_path(@category)
  end

  def items_params
    params(:item).permit(:name, :amount)
  end
end
