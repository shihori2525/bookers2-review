class UsersController < ApplicationController
  before_action :correct_user, only: [:edit,:update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
    @book = Book.find(params[:id])
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end
end
