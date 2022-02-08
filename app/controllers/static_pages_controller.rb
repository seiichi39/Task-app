class StaticPagesController < ApplicationController

  def top
    @user = User.find_by(id: session[:user_id])
  end

end
