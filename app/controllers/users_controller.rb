class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: [:show, :edit]

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
    p "HELLLLOOOOOO"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end  

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end

