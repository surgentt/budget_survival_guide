class UsersController < ApplicationController
  before_action :correct_user,   only: [:edit, :update] 

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params, guest: false)
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.guest = false
    @user.save
    if @user.update(user_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
