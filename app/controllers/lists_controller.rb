class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
    render :new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      redirect_to lists_path
    else
      render:new
    end
  end
end
