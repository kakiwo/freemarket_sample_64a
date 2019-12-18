class ItemsController < ApplicationController
  before_action :set_user, :set_image


  def index
    @items = Item.all

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(create_params)

      if @item.save
        redirect_to root_path
      else
        render "new"
    end
  end

  def buy
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
    @images = @images.image
  end



  private
  def create_params
    params.require(:item).permit(:name, :description, :prefecture, :size, :status, :shipping_fee, :prefecture_id, :shipping_date, :price, :shipping_method,  :profit, images_attributes: [:image, :id, :_destroy])
    # .merge(seller_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_image
    @images = Image.find(params[:id])
  end
end