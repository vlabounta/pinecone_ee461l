class StaticPagesController < ApplicationController
  def home
    @user = User.find(current_user)
  end

  def help
  end

  def about
  end
end
