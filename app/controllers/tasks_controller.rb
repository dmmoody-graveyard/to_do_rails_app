class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      flash[:notice] = @task.description + " successfully save to " + @list.name
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  scope :not_done, -> { where(done: false) }

private
  def task_params
    params.require(:task).permit(:description)
  end
end
