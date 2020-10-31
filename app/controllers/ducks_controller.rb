class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def show
    @duck = Duck.find(params[:id])
  end

  def new
    @duck = Duck.new
  end

  def edit
    @duck = Duck.find(params[:id])
  end

  def create
    @duck = Duck.new(duck_params)
    if @duck.save
    redirect_to duck_path(@duck)    
    else
      flash[:errors] = @duck.errors.full_messages
      redirect_to new_duck_path
    end
  end

  def update
    @duck = Duck.find(params[:id])
    if @duck.update(duck_params)
    redirect_to duck_path(@duck)
    else
      flash[:errors] = @duck.errors.full_messages
      redirect_to edit_duck_path
    end
  end

  private

  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

end
