class WorkflowController < ApplicationController
  def new
    
  end

  def create
    @workflow = Workflow.new(workflow_params)
  end

  def destroy
  end

  def update
  end

  private

    def workflow_params
      params.require(:workflow).permit(:author_id, :title, :description)
    end
end
