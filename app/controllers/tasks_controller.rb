class TasksController < ApplicationController
  before_action :set_user
  before_action :set_task, only: [:show, :destroy]

  def new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'タスクを新規作成しました'
      redirect_to user_tasks_url
    else
      render :new
    end
  end
  
  def index
    @tasks= User.find(@user.id).tasks.all
  end
  
  def show
  end
  
  def destroy
    @task.destroy
    flash[:success] = "#{@task.name}を削除しました"
    redirect_to user_tasks_url
  end
  
  private
  
    def set_user
      @user = User.find(params[:user_id])
    end
    
    def set_task
      @task = User.find(@user.id).tasks.find(params[:id])
    end
    
    def task_params
      params.permit(:name, :description, :user_id)
    end
  
end
