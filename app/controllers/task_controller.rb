class TaskController < ApplicationController
  def index
    @tasks = Task.order('title').finder(params[:q]).page(params[:page]).per(params[:per])
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
  end
end
