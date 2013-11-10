require 'spec_helper'

describe Workflow do
  let(:user) { FactoryGirl.create(:user) }
  let(:new_hire) { FactoryGirl.create(:new_hire) }

  before do
    @workflow = user.workflows.build
    @workflow.new_hire = new_hire
  end

  subject { @workflow }

  it { should respond_to(:tasks) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:new_hire_id) }
  it { should respond_to(:new_hire) }

end
