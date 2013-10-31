class ConnectMailboxController < ApplicationController
  before_filter :set_context_handle

  def create
    callback = callback_url + "?user_id=#{current_user.id}"
    token = @api.connect_tokens.create(callback)
    redirect_to token.browser_redirect_url
  end

  def callback
    t = @api.connect_tokens[params[:contextio_token]]
    account_id = t.account.id
    current_user = User.find(params[:user_id])
    current_user.update_attribute(:context_account_id, account_id)
    flash[:success] = "Your mailbox has been added"
    redirect_to root_path
  end

  def set_context_handle
    @api = ContextIO.new('s4gvms7r', 'Y1ujJ46crM1jFpdU')
  end
end
