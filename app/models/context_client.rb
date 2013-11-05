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

  # ARGs: options hash - :limit, :from, :to
  def most_recent_messages(options = {})
    options[:limit] = 5 if options[:limit].nil?
    hash = {"limit"=>options[:limit],
        "from"=> options[:from], "to"=>options[:to]}
    
    unless account_id.nil?
      account = api_handle.accounts[account_id]
      @messages = account.messages.where(hash)
    end
  end
 
end
