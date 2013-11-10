require 'spec_helper'

describe NewHire do

  let(:new_hire) { FactoryGirl.create(:new_hire) }
  before do
    @new_hire = new_hire
  end

  subject { @new_hire }

  it { should respond_to(:workflows) }

end
