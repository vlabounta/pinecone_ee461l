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
      # fix this
      send(:account_id=, account_id)
    end
  end
 
  def persisted?
    false
  end

  # Displays the most recent messages according to specific constraints
  # Params:
  # +options+:: a hash containing where constraints to be used when querying CIO
  def most_recent_messages(options = {})
    options[:limit] = 5 if options[:limit].nil?
    hash = {"limit"=>options[:limit],
        "from"=> options[:from], "to"=>options[:to]}
    
    unless account_id.nil?
      account = api_handle.accounts[account_id]
      @messages = account.messages.where(hash)
    end
  end

  # Gets file attachments 
  # Params:
  # +options+:: a hash of options containing where constraints to be used when querying CIO
  def get_attachments(options = {})
    options[:limit] ||= 5
    account = api_handle.accounts[account_id]
    files = account.files.where(from: options[:from], limit: options[:limit])
  end

  # Extracts links from text
  # Params:
  # +content+:: text containing urls to be parsed
  def extract_links(content)
    regex = /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/
    first_pass = content.scan(regex)
    urls = []
    first_pass.each do |url_array|
      urls << url_array.first
    end
    urls
  end
end
