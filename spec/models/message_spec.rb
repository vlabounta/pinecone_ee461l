require 'spec_helper'

describe Message do

  let(:user) { FactoryGirl.create(:user) }
  let(:workflow) { FactoryGirl.create(:workflow, :user => user) }
  let(:task) { FactoryGirl.create(:task, :workflow => workflow) }
  before do
    @message = task.build
  end

  subject { @message }

  it { should respond_to(:task_id) }
  it { should respond_to(:task) }
end
