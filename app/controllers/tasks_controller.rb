class TasksController < ApplicationController
  def index
    #@tasks = Task.order('title').finder(params[:q]).page(params[:page]) #for select2
    @tasks = Task.find( :all, :select => 'title' ).map( &:title ) #for typeahead
    respond_to do |format|
      format.html
      format.json { render json: @tasks }
    end
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
    @task.destroy
    flash[:success] = "Task deleted"
    redirect_to root_url
  end

  private

    def task_params
      params.require(:task).permit(:title, :description)
    end
end
