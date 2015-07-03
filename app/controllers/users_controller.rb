class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update]

  def show

  end 

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end  

  private

  def set_user
    @user = User.find(params[:id])
  end  

  def user_params
    params.require(:user).permit(:email, :username, :password, :first_name, :avatar, :trash_talk)
  end
end

