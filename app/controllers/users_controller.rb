class UsersController < ApplicationController
  def index
    @users = User.all
    render :json => @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url
    else
      render :json => @user.errors.full_messages
    end
  end

  def new
    @user = User.new
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end