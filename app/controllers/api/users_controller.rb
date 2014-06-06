class Api::UsersController < ApplicationController
  # before_action :require_current_user!, :except => [:create]
  before_action :forbid_current_user!, :only => [:new, :create]

  def index
    @users = User.all
    render :json => @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to root_url
      # redirect_to user_url(@user)
      # render :json => @user
    else
      render :json => @user.errors.full_messages
    end
  end

  def new
    @user = User.new
    # render :new
  end

  def show
    @user = User.find(params[:id])
    render :json => @user # => for Backbone EJS template
    # render :show  # => for ERB template
  end

  private

  def user_params
    params.require(:user).permit(:email, :password,
                                 :fname, :lname, :gender,
                                 :city, :state, :avatar
    )
  end
end