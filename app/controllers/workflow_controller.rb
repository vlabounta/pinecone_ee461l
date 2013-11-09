class WorkflowController < ApplicationController
  def new
    
  end

  def create
    @workflow = Workflow.new(workflow_params)
    if @workflow.save
      flash[:success] = "#{@workflow.title} workflow successfully created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    Workflow.find(params[:id]).destroy
    flash[:success] = "Workflow deleted"
    redirect_to root_path
  end

  def update
  end

  private

    def workflow_params
      params.require(:workflow).permit(:author_id, :title, :description)
    end
end
