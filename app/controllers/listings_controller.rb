class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]
  before_action :set_form_vars, only: [:new, :edit]

  def index
    @listings = Listing.all
  end

  def show
    
  end

  def new 
    @listing = Listing.new
  end 

  def create 
    @listing = current_user.listings.new(listing_params)
    if @listing.save 
      redirect_to @listing, notice: "Listing successfully created"
    else
      pp @listing.errors
      set_form_vars
      render "new", notice: "Something went wrong"
    end 
  end 

  def edit 

  end 

  def update 
    @listing.update(listing_params)
    if @listing.save 
      redirect_to @listing, notice: "Listing successfully updated"
    else
      pp @listing.errors
      set_form_vars
      render "edit", notice: "Something went wrong"
    end 
  end 

  def destroy 
      @listing.destroy
      redirect_to listings_path, noticeL "Successfully deleted"
  end
  
  private

  def listing_params
    params.require(:listing).permit(:title, :price, :category_id, :condition, :description, :picture)
  end

  def authorize_user
    if @listing.user_id != current_user.id
      flash[:alert] = "You don't have permission to do that"
      redirect_to listings_path
    end
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def set_form_vars
    @categories = Category.all
    @conditions = Listing.conditions.keys
  end 
end