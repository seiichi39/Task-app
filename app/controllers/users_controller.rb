class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :current_user2, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user, only: [:index]  
  
  def show
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "ユーザーを更新しました"
      redirect_to user_url(@user)
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}を削除しました"
    redirect_to users_url
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # ログイン済みのユーザーであるか確認する。    
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end
    
    #アクセスしたユーザーの情報を取得する。
    def set_user
      @user = User.find(params[:id])
    end
    
    #アクセスしたユーザーが現在ログインしているユーザーか確認する。
    def current_user2
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
    
    #ログインユーザーのIDからユーザー情報を取得する。
    def set_current_user
      @user = User.find(current_user.id)       
    end
    
    #管理者権限、または現在ログインしているユーザーを許可する。
    def admin_or_correct_user
      @user = User.find(params[:user_id]) if @user.blank?
      unless current_user?(@user) || current_user.admin?
        flash[:danger] = "閲覧権限がありません。"
        redirect_to(root_url)
      end
    end
end
