class WorkflowsController < ApplicationController
  def new
    @workflow = Workflow.new
  end

  def create
    @workflow = current_user.workflows.build(workflow_params)
    @workflow.author_id = current_user.id
    @workflow.new_hire = NewHire.find_by(email: params[:workflow][:goon_email])

    tasks = params[:workflow][:tasks]
    tasks.each do |task_title|
      task = Task.new(title: task_title)
      if task.save
        @workflow.tasks << task
      end
    end

    if @workflow.save
      flash[:success] = "#{@workflow.title} workflow successfully created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    @workflow.destroy
    flash[:success] = "Workflow deleted"
    redirect_to root_path
  end

  def update
  end

  private

    def workflow_params
      params.require(:workflow).permit(:title, :description, :tags, :goon_email)
    end
end
