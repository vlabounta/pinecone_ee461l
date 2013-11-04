class ContextClient
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
 
  attr_accessor :api_handle, :account_id

  def initialize(attributes = {})
    handle = ContextIO.new(attributes[:key], attributes[:secret])
    self.send(:api_handle=, handle)
    self.send(:account_id=, attributes[:account_id]) unless attributes[:account_id].nil?
  end
 
  def persisted?
    false
  end
 
  def get_last_five_subjects
    account = api_handle.accounts[account_id]
    
  end
 
end
