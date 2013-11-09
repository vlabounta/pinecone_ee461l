require 'spec_helper'

describe Workflow do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @workflow = user.workflows.build
  end

  subject { @workflow }

  it { should respond_to(:tasks) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }

end
