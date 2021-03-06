class ItemsController < ApplicationController
  def index
  end

  def show
    @supplier = AccountObject.where(AccountObjectID: params[:id])
    @items = InventoryItem.all
    @selected_items = @supplier[0].item
    #binding.pry
  end

  def insert
     #binding.pry
    @list_items = InventoryItem.where(InventoryItemID: params[:list_items])
    @list_items.each do |item|
      params_create = {item_id: item.InventoryItemID,
                       item_code: item.InventoryItemCode,
                       supplier_id: params[:supplier_id]}
      Item.create(params_create)
    end
    redirect_to item_path(params[:supplier_id])
  end

  def suppliers
    @suppliers = AccountObject.all
  end
end
