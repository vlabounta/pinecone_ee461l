class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @user = User.find(current_user)
    end
  end

  def help
  end

  def about
  end
end
