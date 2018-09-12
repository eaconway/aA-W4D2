class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end
  
  def show
    @cat = Cat.find(params[:id])
    render :show
  end
  # etc
  
  def new
    @cat = Cat.new
    render :new
  end
  
  def create
    # debugger
    @cat = Cat.new(cat_params)
    
    if @cat.save
      redirect_to cats_url(@cat)
    else
      redirect_to cats_url
    end
  end
  
  def edit
    @cat = Cat.find(params[:id])
    
    render :edit 
  end
  
  def update
    @cat = Cat.find(params[:id])
    # debugger
    if @cat.update(cat_params)
      redirect_to cats_url(@cat)
    else
      redirect_to cats_url
    end
  end
  
  def destroy
    
  end
  
  private
  
  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end
end