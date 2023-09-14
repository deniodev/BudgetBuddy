class ItemsController < ApplicationController
  def new
    @category = Category.includes(:user).find_by(id: params[:category_id])
    @item = Item.new
  end

  def create
    @category = Category.includes(:user).find_by(id: params[:category_id])
    @item = Item.new(items_params)
    @item.author = current_user

    flash[:notice] = if @item.save
                       @item.categories << Category.find(params[:category_id])
                       'Created successfully'
                     else
                       'Failed to create!'
                     end
    redirect_to category_path(@category)
  end

  def edit
    @item = Item.find(params[:id])
    @category = @item.categories.first
  end

  def update
    @item = Item.find(params[:id])

    flash[:notice] = if @item.update(items_params)
                       'Updated successfully'
                     else
                       'Failed to update!'
                     end
    redirect_to category_path(@item.categories.first)
  end

  def destroy
    @item = Item.find(params[:id])
    @category = @item.categories.first

    flash[:notice] = if @item.destroy
                       'Deleted successfully'
                     else
                       'Failed to delete!'
                     end
    redirect_to category_path(@category)
  end

  def items_params
    params.require(:item).permit(:name, :amount)
  end
end
