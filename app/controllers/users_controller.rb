class UsersController < ApplicationController
  access admin: :all

  def index
    @users = User.all
  end

  def new
    @user = User.new

    render 'users/new'
  end

  def create
    user = User.new(user_params)
    user.save

    redirect_to user_path(user.id), notice: "New user has been created."
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?

    user = User.find(params[:id])
    user.update(user_params)

    redirect_to user_path(user.id), notice: "User has been updated."
  end

  def destroy
    User.destroy(params[:id])

    redirect_to users_path, notice: "User has been deleted."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end
end
