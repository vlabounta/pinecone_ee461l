class ConnectMailboxController < ApplicationController
  before_filter :set_context_handle

  def create
    token = @api.connect_tokens.create('http://127.0.0.1:3000/connect_mailbox/callback')
    redirect_to token.browser_redirect_url
  end

  def callback
    t = @api.connect_tokens[params[:contextio_token]]
    account_id = t.account.id
    logger.debug "Account_id #{account_id}"
    current_user = self.current_user
    logger.debug "cookie #{cookies[:remember_token]}"
    @current_user.context_account_id = account_id
  end

  def set_context_handle
    @api = ContextIO.new('s4gvms7r', 'Y1ujJ46crM1jFpdU')
    @current_user ||= current_user
  end
end
