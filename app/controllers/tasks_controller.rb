class TasksController < ApplicationController
  before_action :set_user
  
  def index
    @tasks= Task.all
  end
  
  private
    def set_user
      @user = User.find(params[:user_id])
    end
  
end
