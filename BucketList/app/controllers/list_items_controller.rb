class ListItemsController < ApplicationController

  before_action :ensure_signed_in
  before_action :load_list_item, only: [:show, :edit, :update, :destroy]

  def new
    @item = ListItem.new
  end

  def create
    @item = ListItem.new(create_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = 'Bucket item created!'
      redirect_to list_item_path(@item)
    else
      flash[:error] = @item.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(update_params)
      flash[:notice] = 'Item updated!'
      redirect_to list_item_path(@item)
    else
      flash[:error] = @item.errors.full_messages.join(', ')
      render :edit
    end
  end

  def index
    @items = current_user.list_items
  end

  def show
  end

  def destroy
    @list_item.destroy!

    flash[:notice] = "#{@list_item.name} deleted!"
    redirect_to list_items_path
  end

  private

  def create_params
    params.require(:list_item).permit(:name, :description)
  end

  def update_params
    params.require(:list_item).permit(:description)
  end

  def load_list_item
    @item = current_user.list_items.find(params[:id])
  end
end

