class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
      flash[:success] = "Wow !You Are signed up!"
    else
      render 'new'
      flash.now[:danger] = "Invalid signup details. Please try again"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)

  end

end
