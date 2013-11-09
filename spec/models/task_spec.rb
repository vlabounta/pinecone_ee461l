require 'spec_helper'

describe Task do
  subject { @task }

  it { should respond_to(:messages) }
  it { should respond_to(:workflow_id) }
  it { should respond_to(:workflow) }
end
