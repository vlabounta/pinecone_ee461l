require 'spec_helper'

describe Workflow do
  subject { @workflow }

  it { should respond_to(:tasks) }
  
end
