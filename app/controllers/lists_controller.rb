class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      flash[:notice] = "Your " + @list.name + " was successfully added"
      redirect_to lists_path
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(params[:list])
      flash[:notice] = "Your " + @list.name + " was successfully updated"
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:notice] = "The list was successfully DESTROYED!"
    redirect_to lists_path
  end

private
  def list_params
    params.require(:list).permit(:name, :description)
  end
end
