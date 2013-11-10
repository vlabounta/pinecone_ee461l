class WorkflowController < ApplicationController
  def new
    
  end

  def create
    @workflow = current_user.workflows.build(workflow_params)
    @workflow.author_id = current_user.id
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
      params.require(:workflow).permit(:title, :description)
    end
end
