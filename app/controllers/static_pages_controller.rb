class StaticPagesController < ApplicationController
  def home
    contextio = ContextIO.new('s4gvms7r', 'Y1ujJ46crM1jFpdU')
    @account = contextio.accounts.where(email: 'chrismcnair83@gmail.com').first
  end

  def help
  end

  def about
  end
end
