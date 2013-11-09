require 'spec_helper'

describe Task do

  let (:user) { FactoryGirl.create(:user) }
  let(:workflow) { FactoryGirl.create(:workflow, :user => user) }
  let(:message) { FctoryGirl.create(:message) }
  before do
    @task = workflow.tasks.build
    @message = @task.messages.build
  end

  subject { @task }

  it { should respond_to(:messages) }
  it { should respond_to(:workflow_id) }
  it { should respond_to(:workflow) }
end
