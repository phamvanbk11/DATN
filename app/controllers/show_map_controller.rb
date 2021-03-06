class ShowMapController < ApplicationController
  def index
    @list_map = MapPurchase.all.map(&:map_id).uniq
    if params[:list_map].nil?
      @list_order = MapPurchase.where( map_id: @list_map.first)
    else
      @list_order = MapPurchase.where( map_id: params[:list_map])
    end
  end
end
