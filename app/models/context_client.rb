class ContextClient
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
 
  attr_accessor :api_handle, :account_id

  def initialize(account_id, key = 's4gvms7r', secret = 'Y1ujJ46crM1jFpdU')
    handle = ContextIO.new(key, secret)
    send(:api_handle=, handle)
    if account_id.nil?
      send(:account_id=, account_id) 
    else
      send(:account_id=, account_id)
    end
  end
 
  def persisted?
    false
  end
 
  def most_recent_messages(limit = 5)
    unless self.account_id.nil?
      account = self.api_handle.accounts[self.account_id]
      Rails.logger.debug "account object: #{account}"
      @messages = account.messages.where(limit: 5)
    end
  end
 
end
